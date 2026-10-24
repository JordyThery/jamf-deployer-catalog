#!/bin/bash

##########################################################################################
#
# Copyright (c) 2025, Jamf Software, LLC.  All rights reserved.
#
#       Redistribution and use in source and binary forms, with or without
#       modification, are permitted provided that the following conditions are met:
#               * Redistributions of source code must retain the above copyright
#                 notice, this list of conditions and the following disclaimer.
#               * Redistributions in binary form must reproduce the above copyright
#                 notice, this list of conditions and the following disclaimer in the
#                 documentation and/or other materials provided with the distribution.
#               * Neither the name of the JAMF Software, LLC nor the
#                 names of its contributors may be used to endorse or promote products
#                 derived from this software without specific prior written permission.
#
#       THIS SOFTWARE IS PROVIDED BY JAMF SOFTWARE, LLC "AS IS" AND ANY
#       EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#       WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#       DISCLAIMED. IN NO EVENT SHALL JAMF SOFTWARE, LLC BE LIABLE FOR ANY
#       DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#       (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#       LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#       ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#       (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#       SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
##########################################################################################
#
# DESCRIPTION
#
# Prompts the user to classify their Mac for management purposes.
#
##########################################################################################
#
# CHANGE LOG
# 1.0 - Created
#
##########################################################################################

##########################################################################################
################################### Global Variables #####################################
##########################################################################################

# Extension of the script (.py, .sh etc)..
scriptExtension=${0##*.}

# Overall name of the family of software we are installing, with extension removed
swTitle=$(/usr/bin/basename "$0" ."${scriptExtension}")

# Log directory
debugDir="/var/log/managed"

# Log file
debugFile="${debugDir}/${swTitle}.log"

# Script Version
ver="1.0"

# Client ID for Jamf Pro API
clientId="${4}"

# Client Secret for Jamf Pro API
clientSecret="${5}"

# Extension Attribute Name
eaName="${6}"

# Enrollment Policy Trigger
policyTrigger="${7}"

# Jamf Pro Server URL
jamfProUrl="$(/usr/bin/defaults read /Library/Preferences/com.jamfsoftware.jamf.plist jss_url)"

##########################################################################################
#################################### Start functions #####################################
##########################################################################################

setup() {

    # Make sure we're root & creating logging dirs

    if [[ $(/usr/bin/id -u) -ne 0 ]]; then
        echo "This script must be run as root" 1>&2
        exit 1
    fi

    if [[ ! -d "${debugDir}" ]]; then
        /bin/mkdir -p "${debugDir}"
        /bin/chmod -R 777 "${debugDir}"
    fi

    if [[ ! -f "${debugFile}" ]]; then
        /usr/bin/touch "${debugFile}"
    fi

    # Log all stdout and stderr output to the debug log file

    exec > >(/usr/bin/tee "${debugFile}") 2>&1

}

start() {

    # Logging start

    echo
    echo "###################-START-##################"
    echo
    echo "Jamf MSP Services"
    echo "Running ${swTitle} Version ${ver}"
    echo
    echo "Started: $(/bin/date)"
    echo

}

finish() {

    # Logging finish

    echo
    echo "Finished: $(/bin/date)"
    echo
    echo "###################-END-###################"

}

getAccessToken() {
    response=$(/usr/bin/curl --silent --location --request POST "${jamfProUrl}api/oauth/token" \
        --header "Content-Type: application/x-www-form-urlencoded" \
        --data-urlencode "client_id=${clientId}" \
        --data-urlencode "grant_type=client_credentials" \
        --data-urlencode "client_secret=${clientSecret}")
    accessToken=$(echo "$response" | /usr/bin/plutil -extract access_token raw -)
    tokenExpiresIn=$(echo "$response" | /usr/bin/plutil -extract expires_in raw -)
    currentEpoch=$(/bin/date +%s)
    tokenExpirationEpoch=$(($currentEpoch + $tokenExpiresIn - 1))
}

checkTokenExpiration() {
    currentEpoch=$(/bin/date +%s)
    if [[ $tokenExpirationEpoch -ge $currentEpoch ]]; then
        echo "Token valid until the following epoch time: $tokenExpirationEpoch"
    else
        echo "No valid token available, getting new token"
        getAccessToken
    fi
}

invalidateToken() {
    responseCode=$(/usr/bin/curl -w "%{http_code}" -H "Authorization: Bearer ${accessToken}" ${jamfProUrl}api/v1/auth/invalidate-token -X POST -s -o /dev/null)
    if [[ ${responseCode} == 204 ]]; then
        echo "Token successfully invalidated"
        accessToken=""
        tokenExpirationEpoch="0"
    elif [[ ${responseCode} == 401 ]]; then
        echo "Token already invalid"
    else
        echo "An unknown error occurred invalidating the token"
    fi
}

promptForClassification() {
    jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"

    title="Computer Classification"
    heading="How will this computer be used?"
    description="Choose '1:1' for a single user, or 'Shared' for multiple users."
    windowType="utility"
    icon="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertNoteIcon.icns"

    result=$("${jamfHelper}" \
        -icon "${icon}" \
        -windowType "${windowType}" \
        -title "${title}" \
        -heading "${heading}" \
        -description "${description}" \
        -button1 "1:1" \
        -button2 "Shared" \
        -defaultButton 1)

    if [ "$result" == "0" ]; then
        classificationValue="1:1"
    elif [ "$result" == "2" ]; then
        classificationValue="Shared"
    else
        echo "No selection"
        exit 1
    fi

    serialNumber=$(/usr/sbin/system_profiler SPHardwareDataType | /usr/bin/awk '/Serial/ {print $4; exit}')

    if ! checkTokenExpiration; then
        return
    fi

    computerJson=$(/usr/bin/curl -s -H "Authorization: Bearer ${accessToken}" -H "Accept: application/json" "${jamfProUrl}JSSResource/computers/serialnumber/${serialNumber}")
    computerId=$(echo "${computerJson}" | plutil -extract computer.general.id raw - 2>/dev/null)

    if ! curl -s -X PUT "${jamfProUrl}JSSResource/computers/id/${computerId}" \
        -H "Authorization: Bearer ${accessToken}" \
        -H "Content-Type: application/xml" \
        -d "<computer><extension_attributes><extension_attribute><name>${eaName}</name><value>${classificationValue}</value></extension_attribute></extension_attributes></computer>"; then
        echo "Failed to update classification attribute for serial ${serialNumber}."
        returncode=1
        return
    else
        echo "Classification attribute updated to '${classificationValue}' for serial ${serialNumber}."
        invalidateToken
    fi

    "${jamfHelper}" -windowType utility -title "Enrollment Continuing" -description "Please wait a moment while we get ready to complete enrollment..." -icon "${icon}" &
    /usr/local/bin/jamf recon

    echo "Triggering policy ${policyTrigger} to complete enrollment..."
    /usr/local/bin/jamf policy -event "${policyTrigger}"
}

##########################################################################################
#################################### End functions #######################################
##########################################################################################

setup
start
promptForClassification
finish
exit "${returncode:-0}"

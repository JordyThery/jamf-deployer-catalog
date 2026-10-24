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
# Script to collect the main logs to help with troubleshooting issues
# Script will check and fail if there is no user logged in
# Logs will be saved to a directory on the logged in user's desktop called
# "Support-Logs-(datestamp)"
#
##########################################################################################
#
# CHANGE LOG
# 1.0 - Created
# 1.1 - Updated to new template standard and corrected error messaging
# 1.2 - Added UserSessionHistory.log to /var/log/managed
# 1.3 - Added Jamf Connect Logs
# 1.4 - Change ownership of logs to logged in user
# 1.5 - Change Jamf Connect Log collection to last 30 days
# 1.6 - Added System Log
# 2.0 - Apply 2024 script template, consolidated if statements into a for loop
# 3.0 - Adapt for JSPP
# 3.1 - Added JSDE logs
#
##########################################################################################

##########################################################################################
################################### Global Variables #####################################
##########################################################################################

# Extension of the script (.py, .sh etc)..
scriptExtension=${0##*.}

# Overall name of the family of software we are installing, with extension removed
swTitle="$(/usr/bin/basename "$0" ."$scriptExtension")"

# Log directory
debugDir="/var/log/managed"

# Log file
debugFile="${debugDir}/${swTitle}.log"

# Script Version
ver="2.0"

# Path to Logs
jamfLogPath="/private/var/log/jamf.log"
managedLogPath="/private/var/log/managed"
munkiLogPath="/Library/Managed Installs/Logs"
installLogPath="/var/log/install.log"
systemLogPath="/var/log/system.log"
jamfAutoUpdateLogPath="/var/log/JamfAutoUpdate.log"
jsdeLogPath="/var/log/JSDE.log"
jsdePreferencesPath="/Library/Preferences/com.jamf.jamfsde.plist"

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

collectLogs() {
    # Generate User Session History log

    returncode=0

    if [[ -f "${managedLogPath}" || -d "${managedLogPath}" ]]; then
        echo "Generating User Session History log file... in ${managedLogPath}/UserSessionHistory.log"
        /usr/bin/last -t console >"${managedLogPath}/UserSessionHistory.log"
    else
        echo "Cannot find ${managedLogPath}..."
    fi

    # Create log folder on desktop
    datestamp="$(/bin/date '+%Y-%m-%d %H-%M-%S')"
    loggedInUser=$(/bin/echo "show State:/Users/ConsoleUser" | /usr/sbin/scutil | /usr/bin/awk '/Name :/ && ! /loginwindow/ { print $3 }')
    logDesktopFolder="/Users/${loggedInUser}/Desktop/Support-Logs-${datestamp}"
    echo "Creating Log folder at ${logDesktopFolder}..."
    if [[ -f "${logDesktopFolder}" ]]; then
        echo "ERROR: Log folder already present. Exiting..."
        returncode=1
        finish
    else
        /bin/mkdir "${logDesktopFolder}"
        /bin/chmod -R 777 "${logDesktopFolder}"
    fi

    # copy each log if present
    for logtype in "${jamfLogPath}" "${managedLogPath}" "${munkiLogPath}" "${installLogPath}" "${systemLogPath}" "${jamfAutoUpdateLogPath}" "${jsdeLogPath}" "${jsdePreferencesPath}"; do
        # Grab Jamf logs
        if [[ -f "${logtype}" || -d "${logtype}" ]]; then
            echo "Copying ${logtype}..."
            /bin/cp -Rp "${logtype}" "${logDesktopFolder}/"
        else
            echo "Cannot find ${logtype}..."
        fi
    done

    # Grab Jamf Connect Logs
    if [[ -f /usr/local/bin/jamfconnect ]]; then
        /usr/local/bin/jamfconnect logs -o "${logDesktopFolder}/" --last 30d
    fi

    # Zip the resulting data
    /usr/bin/zip -r "${logDesktopFolder}.zip" "${logDesktopFolder}/"

    # Change ownership
    /usr/sbin/chown "${loggedInUser}" "${logDesktopFolder}.zip"
    /usr/sbin/chown -R "${loggedInUser}" "${logDesktopFolder}"

}

##########################################################################################
#################################### End functions #######################################
##########################################################################################

start
setup
collectLogs
finish
exit "${returncode:-0}"

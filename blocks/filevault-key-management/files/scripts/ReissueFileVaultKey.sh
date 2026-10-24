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
# Inspired by and based on https://github.com/homebysix/jss-filevault-reissue
#
# This script is intended to run on Macs which no longer have a valid recovery key in the
# JSS. It prompts users to enter their Mac password, and uses this password to generate a
# new FileVault key and escrow with the JSS. A profile with the Security payload that
# redirects FileVault keys to the MDM server is required for this script to work
# correctly.
#
##########################################################################################
#
# CHANGE LOG
# 1.0 - Created
# 2.0 - Revised and rewritten to dataJAR style guidelines
# 2.1 - Refactor into JSPP script template, use Self Service icon if dataJAR icon is missing
# 2.2 - Dialog wording re-write and use customer/JSDE branding
#
##########################################################################################

##########################################################################################
################################### Global Variables #####################################
##########################################################################################

# Extension of the script (.py, .sh etc)..
scriptExtension=${0##*.}

# Overall name of the family of software we are installing, with extension removed
swTitle=$(/usr/bin/basename "$0" ."$scriptExtension")

# Log directory
debugDir="/var/log/managed"

# Log file
debugFile="${debugDir}/${swTitle}.log"

# Script Version
ver="2.2"

# Path to an icon that will be used in messaging.
icon="/Library/Application Support/JSDE/Logo.png"

# The title of the message that will be displayed to the user.
promptTitle="Renew FileVault Recovery Key"

# The body of the message that will be displayed before prompting the user for
# their password.
promptMessage="It's time to renew your Mac's FileVault Recovery Key so that your IT team can help you unlock your Mac in case you forget your login password.

Click the Next button below, then enter your Mac's password when prompted."

# The body of the message that will be displayed after 5 incorrect passwords.
forgotPwMessage="You made five incorrect password attempts.

Please contact your IT team for help with your Mac password."

# The body of the message that will be displayed after successful completion.
successMessage="Thank you! Your FileVault key has been escrowed."

# The body of the message that will be displayed if a failure occurs.
failMessage="Sorry, an error occurred while escrowing your FileVault key. 

Please contact your IT team for help."

# Get the logged in user's name
loggedInUser=$(echo "show State:/Users/ConsoleUser" | /usr/sbin/scutil | /usr/bin/awk '/Name :/ { print $3 }')

# Find the user ID for current logged in user
userId=$(/usr/bin/id -u "${loggedInUser}")

# Location of Jamf Helper
jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"

# Check the status of FileVault
fvStatus=$(/usr/bin/fdesetup status)

# List of FileVault Users
fvUsers=$(/usr/bin/fdesetup list)

# Get the current macOS version of the device
osVersion=$(/usr/bin/sw_vers -productVersion)

##########################################################################################
#################################### Start functions #####################################
##########################################################################################

setup() {

    # Make sure we're root & creating logging dirs

    if [[ $(/usr/bin/id -u) -ne 0 ]]; then
        echo "This script must be run as root" 1>&2
        exit 1
    fi

    if [[ ! -d "{debugDir}" ]]; then
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
    echo "Re-issue Filevault Recovery Key script version ${ver}"
    echo
    echo "Started: $(/bin/date)"
    echo
    echo "Running Re-issue Filevault Recovery Key script. "

}

preflightchecks() {

    # Check for branding icon on disk and set to Self Service if not found

    if [[ ! -f "${icon}" ]]; then
        echo
        echo "INFO: Setting icon to JSDE..."
        icon="/Applications/JSDE.app/Contents/Resources/AppIcon.icns"
    fi

    # Check for logged in user and exit if not...

    if [[ -z "${loggedInUser}" ]]; then
        echo
        echo "WARNING: No user logged in, exiting..."
        echo
        echo "${osVersion}"
        echo
        echo "Exited script run: $(/bin/date)"
        echo
        echo "###################-EXITED-###################"
        exit 1
    fi

    # Check operating system version and exit if unsupported...

    if [[ "${OSTYPE:6}" -ge 19 ]]; then
        echo
        echo "SUCCESS: Device is running macOS ${osVersion}, continuing..."
    else
        echo
        echo "WARNING: OS version not 10.15+ or OS version unrecognized, exiting..."
        echo
        echo "${osVersion}"
        echo
        echo "Exited script run: $(/bin/date)"
        echo
        echo "###################-EXITED-###################"
        exit 1
    fi

}

checkencryptioncomplete() {

    # Check that FileVault encryption has completed

    if /usr/bin/grep -q "Encryption in progress" <<<"${fvStatus}"; then
        echo
        echo "WARNING: FileVault encryption is in progress. Please run the script again when it finishes, exiting..."
        echo "${fvStatus}"
        echo
        echo "Exited script run: $(/bin/date)"
        echo
        echo "###################-EXITED-###################"
        exit 1
    elif /usr/bin/grep -q "FileVault is Off" <<<"${fvStatus}"; then
        echo
        echo "WARNING: Encryption is not active, exiting..."
        echo "${fvStatus}"
        echo
        echo "Exited script run: $(/bin/date)"
        echo
        echo "###################-EXITED-###################"
        exit 1
    elif ! /usr/bin/grep -q "FileVault is On" <<<"${fvStatus}"; then
        echo
        echo "WARNING: Unable to determine encryption status, exiting..."
        echo "${fvStatus}"
        echo
        echo "Exited script run: $(/bin/date)"
        echo
        echo "###################-EXITED-###################"
        exit 1
    fi

}

checkifcurrentuserisalreadyauthorised() {

    # Check if current user is FileVault enabled

    if ! /usr/bin/grep -E -q "^${loggedInUser}," <<<"${fvUsers}"; then
        echo
        echo "WARNING: ${loggedInUser} is not on the list of FileVault enabled users, exiting..."
        echo "${fvUsers}"
        echo
        echo "Exited script run: $(/bin/date)"
        echo
        echo "###################-EXITED-###################"
        exit 1
    fi

}

issuenewrecoverykey() {

    # Re-issue FileVault Recovery Key

    echo
    echo "Alerting user ${loggedInUser} about incoming password prompt..."
    /bin/launchctl asuser "${userId}" /usr/bin/sudo -u "${loggedInUser}" "${jamfHelper}" -windowType "utility" -icon "${icon}" -title "${promptTitle}" -description "${promptMessage}" -button1 "Next" -defaultButton 1 -startlaunchd &>/dev/null
    echo
    echo "Prompting ${loggedInUser} for their Mac password..."

    # Convert POSIX path of icon to Mac path for AppleScript.
    iconPosix=$(/usr/bin/osascript -e 'return POSIX file "'"${icon}"'" as text')
    userPass=$(/bin/launchctl asuser "${userId}" /usr/bin/sudo -u "${loggedInUser}" /usr/bin/osascript -e 'display dialog "Please enter the password you use to log in to your Mac:" default answer "" with title "'"${promptTitle//\"/\\\"}"'" giving up after 86400 with text buttons {"OK"} default button 1 with hidden answer with icon file "'"${iconPosix//\"/\\\"}"'"' -e 'return text returned of result')
    # Validate password.
    try=1
    until /usr/bin/dscl /Search -authonly "${loggedInUser}" "${userPass}" &>/dev/null; do
        ((try++))
        echo
        echo "Prompting ${loggedInUser} for their Mac password (attempt $try)..."
        userPass=$(/bin/launchctl asuser "${userId}" /usr/bin/sudo -u "${loggedInUser}" /usr/bin/osascript -e 'display dialog "Sorry, that password was incorrect. Please try again:" default answer "" with title "'"${promptTitle//\"/\\\"}"'" giving up after 86400 with text buttons {"OK"} default button 1 with hidden answer with icon file "'"${iconPosix//\"/\\\"}"'"' -e 'return text returned of result')
        if ((try >= 5)); then
            echo
            echo "WARNING: Password prompt unsuccessful after 5 attempts. Displaying \"forgot password\" message..."
            /bin/launchctl asuser "${userId}" /usr/bin/sudo -u "${loggedInUser}" "${jamfHelper}" -windowType "utility" -icon "${icon}" -title "${promptTitle}" -description "${forgotPwMessage}" -button1 'OK' -defaultButton 1 -startlaunchd &>/dev/null &
            echo
            echo "Exited script run: $(/bin/date)"
            echo
            echo "###################-EXITED-###################"
            exit 1
        fi
    done
    echo
    echo "Successfully prompted for Mac password."

    if /bin/launchctl list | /usr/bin/grep -q "com.apple.security.FDERecoveryAgent"; then
        echo
        echo "Unloading FDERecoveryAgent LaunchDaemon..."
        /bin/launchctl unload /System/Library/LaunchDaemons/com.apple.security.FDERecoveryAgent.plist
    fi

    if /usr/bin/pgrep -q "FDERecoveryAgent"; then
        echo
        echo "Stopping FDERecoveryAgent process..."
        /usr/bin/killall "FDERecoveryAgent"
    fi

    userPass=${userPass//&/&amp;}
    userPass=${userPass//</&lt;}
    userPass=${userPass//>/&gt;}
    userPass=${userPass//\"/&quot;}
    userPass=${userPass//\'/&apos;}

    echo
    echo "Issuing new recovery key..."

    fdesetupOutput=$(
        /usr/bin/fdesetup changerecovery -verbose -personal -inputplist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Username</key>
    <string>${loggedInUser}</string>
    <key>Password</key>
    <string>${userPass}</string>
</dict>
</plist>
EOF
    )

    fdesetupResult=$?

    unset userPass

    /usr/bin/grep -q "Escrowing recovery key..." <<<"${fdesetupOutput}"
    if [[ $fdesetupResult -ne 0 ]]; then
        echo
        echo "WARNING: fdesetup exited with return code: ${fdesetupResult}, exiting..."
        echo "See this page for a list of fdesetup exit codes and their meaning:"
        echo "https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man8/fdesetup.8.html"
        echo "Displaying \"failure\" message..."
        /bin/launchctl asuser "${userId}" /usr/bin/sudo -u "${loggedInUser}" "${jamfHelper}" -windowType "utility" -icon "${icon}" -title "${promptTitle}" -description "${failMessage} fdesetup exited with code ${fdesetupResult}. Output: ${fdesetupOutput}" -button1 'OK' -defaultButton 1 -startlaunchd &>/dev/null &
        echo
        echo "Exited script run: $(/bin/date)"
        echo
        echo "###################-EXITED-###################"
        exit 1
    elif [[ "${fdesetupOutput}" != *"New personal recovery key"* ]]; then
        echo
        echo "WARNING: FileVault key was not generated, exiting..."
        echo
        echo "Displaying \"failure\" message..."
        /bin/launchctl asuser "${userId}" /usr/bin/sudo -u "${loggedInUser}" "${jamfHelper}" -windowType "utility" -icon "${icon}" -title "${promptTitle}" -description "${failMessage} ERROR: New FileVault key not generated." -button1 'OK' -defaultButton 1 -startlaunchd &>/dev/null &
        echo
        echo "Exited script run: $(/bin/date)"
        echo
        echo "###################-EXITED-###################"
        exit 1
    else
        newKeyLastPart=$(echo "${fdesetupOutput}" | /usr/bin/awk -F '-' '{print $NF}' | /usr/bin/tr -d "'")
        newKeyMasked="####-####-####-####-####-${newKeyLastPart}"
        echo
        echo "New personal recovery key: ${newKeyMasked}"
        echo
        echo "SUCCESS: FileVault key generated and passed back to Jamf..."
        echo
        echo "Displaying \"success\" message..."
        /bin/launchctl asuser "${userId}" /usr/bin/sudo -u "${loggedInUser}" "${jamfHelper}" -windowType "utility" -icon "${icon}" -title "${promptTitle}" -description "${successMessage}" -button1 'OK' -defaultButton 1 -startlaunchd &>/dev/null &
    fi
    return $fdesetupResult

}

finish() {

    echo
    echo "Finished: $(/bin/date)"
    echo
    echo "###################-END-###################"

}

##########################################################################################
#################################### End functions #######################################
##########################################################################################

setup
start
preflightchecks
checkencryptioncomplete
checkifcurrentuserisalreadyauthorised
issuenewrecoverykey
finish

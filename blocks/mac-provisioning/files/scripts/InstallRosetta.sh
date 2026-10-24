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
# Installs rosetta if running on a Apple Silicon Mac
#
##########################################################################################
#
# CHANGE LOG
# 1.0 - Created
# 2.0 - Updated paths and functions
# 2.1 - Added retry logic
# 3.0 - Applied 2024 script template
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
ver="3.0"

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

installrosetta() {

    # Installs rosetta if running on a Apple Silicon Mac if not already present

    if [[ "$(/usr/bin/arch)" == "arm64" ]]; then
        # oahd is the name of the rosetta process
        if /usr/bin/pgrep oahd >/dev/null 2>&1; then
            echo "Rosetta 2 is already installed"
        else
            retryCount=1
            until [[ "${retryCount}" -gt 5 ]]; do
                echo "Installing Rosetta 2 (attempt ${retryCount})..."
                /usr/sbin/softwareupdate --install-rosetta --agree-to-license
                /usr/bin/pgrep oahd >/dev/null 2>&1 && break
                retryCount=$((retryCount + 1))
                sleep 30
            done
        fi
    else
        echo "This is an Intel Mac so Rosetta neither required nor available."
    fi

}

##########################################################################################
#################################### End functions #######################################
##########################################################################################

setup
start
installrosetta
finish

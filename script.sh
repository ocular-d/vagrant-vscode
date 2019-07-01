#!/bin/bash -eux

set -euo pipefail

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
#COL_RED=$ESC_SEQ"31;01m"
#COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"

# Functions
# Update
update() {
    echo
    echo -en "${COL_YELLOW} ==> Updating sources ${COL_RESET}\n"
    apt update -y -qq
}


# Upgrade
upgrade() {
    echo -en "${COL_YELLOW} ==> Upgrading packages to latest versions ${COL_RESET}\n"
    apt upgrade -y -qq
}

#The script is used for graphic environment
vb-guest() {
    echo -en "${COL_YELLOW} ==> Installing VirtualBox guest extension ${COL_RESET}\n"
    if grep -q VBOX /proc/scsi/scsi; then
        echo "*** Installing virtualbox-guest-x11"

    export DEBIAN_FRONTEND="noninteractive"
    apt install -y -qq --no-install-recommends virtualbox-guest-x11
    fi
}

# Install Ubuntu Desktop
desktop() {
    echo -en "${COL_YELLOW} ==> Installing Ubuntu desktop ${COL_RESET}\n"
    apt install -y -qq ubuntu-desktop
}

# Use snap to install Code
vscode() {
    echo -en "${COL_YELLOW} ==> Installing Visual Studio Code ${COL_RESET}\n"
    snap install --classic code
}

update
upgrade
vb-guest
desktop
vscode

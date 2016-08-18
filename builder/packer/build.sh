#!/bin/bash
#set -eux

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
#COL_MAGENTA=$ESC_SEQ"35;01m"
#COL_CYAN=$ESC_SEQ"36;01m"

## Functions we use
# Error

function error_exit {
	echo -en "$COL_RED$1$COL_RESET" 1>&2
	exit 1
}

# Remove old iso
echo -en "$COL_YELLOW ==> Removing old iso files$COL_RESET\n"
rm -rf output-virtualbox-iso
sleep 5s

# Start with a friendly message
echo -en "$COL_BLUE ==> Starting build process, first check which OS we're on$COL_RESET\n"


# Check if we are on Ubuntu or Fedora
OS=`lsb_release -si`

if [ "$OS" == "Fedora" ]; then
	echo -en "$COL_YELLOW ==> Detected Fedora$COL_RESET\n"
	sleep 5s
	clear
	~/bin/packer build debian-8-jessie-virtualbox.json
elif [ "$OS" == "Ubuntu" ]; then
	echo -en "$COL_YELLOW ==> Detected Ubuntu, will use packer$COL_RESET\n"
	sleep 5s
	clear
	packer build debian-8-jessie-virtualbox.json
fi

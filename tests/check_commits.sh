#!/bin/bash
set -e

# We will check if the last commits contains which are restructured test [rst]
# If so we will run some checks like spell and link-check against these files.

## Functions we use
# Error

error_exit() {
        #echo -en "$COL_RED$1$COL_RESET" 1>&2
        exit 1
}

# Check if docs directory has an index.rst if not fail
if [ -f docs/index.rst ]; then
	: # continue with checks
else
	echo "The File  Does Not Exist"
	error_exit
fi

# Check if last commit includes rst
changed_files="$(git diff HEAD~1 --name-only | grep ".*\.rst$")"

#echo "$changed_files" | grep --quiet "$1" && eval "$2"
echo "$changed_files"
if [[ "$changed_files" == *.rst ]]
then
    : # continue with checks
else
	error_exit
fi


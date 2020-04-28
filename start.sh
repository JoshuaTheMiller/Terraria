#!/bin/bash

# This doesn't allow for using spaces in a password... I'm open to making this more advanced if anyone
# has any tips. I found the following website handy when making this: 
# https://www.jdoodle.com/test-bash-shell-script-online/
REGEX_PASSWORD_EXTRACT="\-password ([^ ]*)"
[[ "$@" =~  $REGEX_PASSWORD_EXTRACT ]] 
extractedPassword=${BASH_REMATCH[1]}

if [ -z $extractedPassword ] 
then 
    echo "Password not set from commandline"
else
    echo "Password will be set from command line"
fi

mono --server --gc=sgen -O=all TerrariaServer.exe -configpath /world -worldpath /world -logpath /world "$@"
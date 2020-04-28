#!/bin/bash

# This doesn't allow for using spaces in a password... I'm open to making this more advanced if anyone
# has any tips. I found the following website handy when making this: 
# https://www.jdoodle.com/test-bash-shell-script-online/
REGEX_PASSWORD_EXTRACT="\-password ([^ ]*)"
[[ "$@" =~  $REGEX_PASSWORD_EXTRACT ]] 
extractedPassword=${BASH_REMATCH[1]}

if [ -z $extractedPassword ] 
then 
    echo "Password not set from argument"
else
    SERVER_CONFIG_PATH="/world/config.json"

    jq --arg p "$extractedPassword" '.ServerPassword=$p' $SERVER_CONFIG_PATH | sponge $SERVER_CONFIG_PATH

    echo "Password set from argument"
fi

mono --server --gc=sgen -O=all TerrariaServer.exe -configpath /world -worldpath /world -logpath /world "$@"
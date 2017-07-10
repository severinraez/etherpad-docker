#!/bin/bash
# If the settings file variable has been set
# overwrite the contents of the settings
if [ ! -z ${SETTINGS_FILE:-} ]; then
    \cp -rf ${SETTINGS_FILE} settings.json
fi

# Same procedure with the session key
if [ ! -z ${SESSIONKEY_FILE:-} ]; then
    \cp -rf ${SESSIONKEY_FILE} SESSIONKEY.txt
fi

# Same procedure with the API key
if [ ! -z ${APIKEY_FILE:-} ]; then
    \cp -rf ${APIKEY_FILE} APIKEY.txt
fi

# Execute the etherpad provided startup script
./bin/run.sh $@

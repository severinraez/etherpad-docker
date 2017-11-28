#!/bin/bash
# If the settings file variable has been set
# overwrite the contents of the settings
if [ ! -z ${SETTINGS_FILE:-} ]; then
    rm -rf settings.json && ln -s ${SETTINGS_FILE} settings.json
fi

# Same procedure with the session key
if [ ! -z ${SESSIONKEY_FILE:-} ]; then
    rm -rf SESSIONKEY.txt && ln -s ${SESSIONKEY_FILE} SESSIONKEY.txt
fi

# Same procedure with the API key
if [ ! -z ${APIKEY_FILE:-} ]; then
    rm -rf APIKEY.txt && ln -s ${APIKEY_FILE} APIKEY.txt
fi

# Execute the etherpad provided startup script
./bin/run.sh $@

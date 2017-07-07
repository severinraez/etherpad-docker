#!/bin/bash
if [ ! -z ${SETTINGS_FILE:-} ]; then
    \cp -rf ${SETTINGS_FILE} settings.json
fi
if [ ! -z ${SESSIONKEY_FILE:-} ]; then
    \cp -rf ${SESSIONKEY_FILE} SESSIONKEY.txt
fi
if [ ! -z ${APIKEY_FILE:-} ]; then
    \cp -rf ${APIKEY_FILE} APIKEY.txt
fi

# Execute the etherpad provided startup script
./bin/run.sh $@

#!/bin/bash
set -eux 

if [ ! -z ${SETTINGS_FILE:-} ]; then
    # There is a custom configuration file in the environment
    \cp -rf ${SETTINGS_FILE} settings.json
fi

# Execute the etherpad provided startup script
./bin/run.sh $@

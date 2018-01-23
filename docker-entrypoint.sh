#!/bin/bash

# If the settings file variable has been set
# overwrite the contents of the settings
if [ ! -z ${SETTINGS_FILE:-} ]; then
    rm -rf settings.json && ln -s ${SETTINGS_FILE} settings.json
fi

TITLE=${TITLE:-"Etherpad"}

if [ -z "$DB_USER" ] || [ -z "$DB_HOST" ] || [ -z "$DB_PASSWORD" ] || [ -z "$DB_NAME" ] || [ -z "$DB_TYPE" ]; then
    echo "One of the environment variables DB_USER DB_HOST DB_PASSWORD DB_NAME DB_TYPE is not set."
    exit 1
fi

sed -i s/DB_USER/$DB_USER/g settings.json
sed -i s/DB_HOST/$DB_HOST/g settings.json
sed -i s/DB_PASSWORD/$DB_PASSWORD/g settings.json
sed -i s/DB_NAME/$DB_NAME/g settings.json
sed -i s/DB_TYPE/$DB_TYPE/g settings.json
sed -i s/TITLE/$TITLE/g settings.json

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

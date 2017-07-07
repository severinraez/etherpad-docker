Etherpad docker
===============

This dockerfile creates an etherpad image that is based on CentOS

Build
-----

To build the etherpad container simply:

```
docker build -t <yourname>/etherpad-docker .
```

There are 3 environment variables that you can define to override the
settings file, api and session keys. If specified the container will
override the values at runtime.

```
docker run -p 9001:9001 -v /root/etherpad-secrets/:/var/secrets/ \
-e "SETTINGS_FILE=/var/secrets/settings.json" \
-e "SESSIONKEY_FILE=/var/secrets/SESSIONKEY.txt" \
-e "APIKEY_FILE=/var/secrets/APIKEY.txt" <IMAGE_ID>
```

This will mount a volume and copy the files from it modifying the behavior
of etherpad

Now connect to etherpad on localhost:9001 from your browser.

#!/bin/bash

echo "Copying settings.js to /data folder"
cp settings.js /data/settings.js
cp /tmp/package.json /data/package.json
cp /tmp/flows.json   /data/flows.json

echo "Starting node-red ..."
npm start -- --userDir /data
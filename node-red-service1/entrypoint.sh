#!/bin/bash

echo "Copying settings.js to /data folder"
cp settings.js /data/settings.js
cp /tmp/flows.json   /data/flows.json

echo "Starting node-red ..."
npm start -- --userDir /data 
# --prefix ./node-red-service1
#!/bin/bash

echo "Copying settings.js to /data folder"
cp settings.js      /data/settings.js
cp flows.json       /data/flows.json
cp flows_cred.json  /data/flows_cred.json

echo "Starting node-red ..."
npm start -- --userDir /data 
# --prefix ./node-red-service1
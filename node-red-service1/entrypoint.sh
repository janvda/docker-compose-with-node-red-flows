#!/bin/bash

echo "Copying settings.js to /data folder"
cp settings.js /data/settings.js
#cp package.json /data/package.json

echo "Starting node-red ..."
npm start -- --userDir /data
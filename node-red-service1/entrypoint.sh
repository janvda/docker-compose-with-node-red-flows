#!/bin/bash

#echo "Copying settings.js to /usr/src/node-red/.node-red/settings.js"
#cp /node-red/settings.js      ./settings.js
#cp flows.json       /data/flows.json
#cp flows_cred.json  /data/flows_cred.json

echo "Starting node-red ..."
npm start --  --userDir /node-red 

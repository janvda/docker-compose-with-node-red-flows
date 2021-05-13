FROM nodered/node-red:1.3.4-12

COPY package.json /data/
# The following command will build all the nodes specified in the package.json that is copied
# in previous command.
RUN  cd /data ; npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Copy Node-RED flow files and settings to userDir
COPY  flows.json flows_cred.json settings.js /data/

# start Node-RED
#ENTRYPOINT  npm start --  --userDir /data

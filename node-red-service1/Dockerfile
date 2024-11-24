FROM nodered/node-red:4.0.5-22

COPY --chown=node-red:node-red package.json /data/
# The following command will build all the nodes specified in the package.json that is copied
# in previous command.
RUN  cd /data ; npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Copy Node-RED flow files and settings to userDir
COPY --chown=node-red:node-red flows.json flows_cred.json settings.js /data/

# start Node-RED
#ENTRYPOINT  npm start --  --userDir /data

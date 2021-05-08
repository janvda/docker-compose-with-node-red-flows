FROM nodered/node-red:1.2.9-12

# creating the Node-RED userDir "/node-red" with proper permissions
USER root
RUN mkdir /node-red
RUN chown node-red:node-red /node-red
USER node-red

COPY package.json /node-red/
# The following command will build all the nodes specified in the package.json that is copied
# in previous command.
RUN  cd /node-red ; npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Copy Node-RED flow files and settings to userDir
COPY  flows.json flows_cred.json settings.js /node-red/

# also Copy settings.js to /data folder as docker healthcheck.js is requiring this.
# see https://github.com/node-red/node-red-docker/issues/232
COPY settings.js /data/

# start Node-RED
ENTRYPOINT  npm start --  --userDir /node-red

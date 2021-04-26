FROM nodered/node-red:1.2.9-12

# creating node-red userDir "/node-red" dir with proper permissions
USER root
RUN mkdir /node-red
RUN chown node-red:node-red /node-red
USER node-red

# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED
COPY package.json /node-red/
RUN  cd /node-red ; npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Copy node-red flow files and settings to userDir
COPY  flows.json flows_cred.json settings.js /node-red/

# start node-red
ENTRYPOINT  npm start --  --userDir /node-red

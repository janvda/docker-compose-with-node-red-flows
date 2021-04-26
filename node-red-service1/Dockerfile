FROM nodered/node-red:1.2.9-12

# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED
COPY package.json ./
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

COPY settings.js entrypoint.sh  ./

COPY flows.json flows_cred.json ./

# the below entrypoint replaces the entrypoint of the nodered/node-red
ENTRYPOINT  ["bash", "entrypoint.sh"]
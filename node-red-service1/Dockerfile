FROM nodered/node-red:1.2.9-12

# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED
COPY package.json ./
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

#COPY settings.js /usr/src/node-red/.node-red/
COPY entrypoint.sh  ./

USER root
RUN mkdir /node-red
RUN chown node-red:node-red /node-red
USER node-red

COPY --chown=node-red flows.json flows_cred.json settings.js /node-red/
# following is added to assure that the flows are not updated outside the node-red project context.
RUN chmod u-w /node-red/flows.json /node-red/flows_cred.json

# the below entrypoint replaces the entrypoint of the nodered/node-red
ENTRYPOINT  ["bash", "entrypoint.sh"]
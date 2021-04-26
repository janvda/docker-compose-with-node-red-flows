FROM nodered/node-red:1.2.9-12

# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED
COPY package.json ./
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

#COPY settings.js /usr/src/node-red/.node-red/
#COPY entrypoint.sh  ./

# creating /node-red dir with proper permissions
USER root
RUN mkdir /node-red
RUN chown node-red:node-red /node-red
USER node-red

COPY  flows.json flows_cred.json settings.js /node-red/

ENTRYPOINT  npm start --  --userDir /node-red

FROM nodered/node-red:1.2.9-12

COPY settings.js entrypoint.sh  ./

COPY flows.json package.json /tmp/

# the below entrypoint replaces the entrypoint of the nodered/node-red
ENTRYPOINT  ["bash", "entrypoint.sh"]
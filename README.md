# docker-compose-with-node-red-flows

This github repository consists of a [sample docker-compose application](docker-compose.yml) consisting of one Node-Red application (`node-red-service1`).

Note that the [actual flow](node-red-service1/flows.json) and [flow credentials file](node-red-service1/flows_cred.json) of the Node-Red application are also stored in this github repository.  So you don't need a separate github repository for the node-red flows.

This sample docker-compose application can be used as a starting point for any docker-compose application having a node-red application as one of its services.  In fact it can even be used to support a docker-compose application consisting of more than one node-red application.

## How to update the Node-RED flows ?

You can directly update the flows of the Node-Red application in the github repository using the Node-Red editor.
For this you must execute the following steps:

1. Clone the github Repository via the Node-RED editor
2. When the Node-RED editor says `Project package file not found` then you must select `Setup project files`
3. In the `Settings` tab you must select `edit`.
4. Next to `Package` you select folder icon and then you select `package.json` under `node-red-service1` folder
5. You select `save` and the `Close`

Now you can update your flows using the Node-Red editor.

Once you have successfully updated the flows don't forget to push your changes to the github repository.

## How to install new Node-RED nodes ?

Once you have properly cloned the github repository (see previous section) you can add new nodes as follows:

1. Install them through the `Manage Palette` tab of the Node-RED editor.
2. So now you can use these installed nodes in your flows.  In some cases it might be needed to restart node-red (so you need to restart the `node-red-service1` container)
3. You also need to add these nodes dependencies to [your package.json](node-red-service1/package.json) by
   1. opening your Project Settings via the Node-RED editor.  
   2. add the respective packages via tab `Dependencies`
4. Push your changes to github.

Note that the [node-red-service1 Dockerfile](node-red-service1/Dockerfile) assures that all the nodes specified in the dependencies section of [your package.json](node-red-service1/package.json) (see step 3) will be built into the container image for `node-red-service1`.

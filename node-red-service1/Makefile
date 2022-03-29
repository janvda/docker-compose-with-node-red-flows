DOCKERHUB_ID:=janvda
SERVICE_NAME:=my-node-red
SERVICE_VERSION:=1.0.0
ARCHITECTURES=linux/amd64,linux/arm/v7,linux/arm64/v8

# if you don't want the build to use cached layers replace next line by :
#        CACHING:= --no-cache
CACHING:=

define HELP
=========================================================================================
Command:

   make buildx

Builds the image $(DOCKERHUB_ID)/$(SERVICE_NAME):$(SERVICE_VERSION)
for architectures: $(ARCHITECTURES)
and publishes it to docker hub.

Before running this command:
1. Assure that docker is running locally.
2. Assure you are not using a remote docker version.
   so DOCKER_HOST (=$(DOCKER_HOST)) or docker context is not pointing to a remote host
=========================================================================================
endef
export HELP

default:
	@echo "$$HELP"

buildx:
	@echo "buildx requires that you must login to dockerhub in order to push any images."
	@echo "So, please enter your dockerhub password or access token here below."
	docker login -u $(DOCKERHUB_ID)
	@echo "Create a new builder instance (docker container) ..."
	docker buildx create --use --name build --node build --driver-opt network=host	
	@echo "Starting the build ..."
	docker buildx build $(CACHING) --push --platform $(ARCHITECTURES) \
	                    --tag $(DOCKERHUB_ID)/$(SERVICE_NAME):$(SERVICE_VERSION) .


.PHONY: default buildx

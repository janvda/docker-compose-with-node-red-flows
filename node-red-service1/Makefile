DOCKERHUB_ID:=janvda
SERVICE_NAME:=my-node-red
SERVICE_VERSION:=1.1.0
ARCHITECTURES=linux/amd64,linux/arm/v7,linux/arm64/v8

# BUILD_DOCKER_CONTEXT specifies the docker context of the build machine
BUILD_DOCKER_CONTEXT=colima

# if you don't want the build to use cached layers replace next line by :
#        CACHING:= --no-cache
CACHING:=

# check if docker context points to the cross platform image build machine
current_docker_context:=$(shell docker context ls | grep -e "*" | cut -d ' ' -f1 )
ifneq (${current_docker_context},$(BUILD_DOCKER_CONTEXT))
    $(error "Current docket context [=$(current_docker_context)] is not '$(BUILD_DOCKER_CONTEXT)'.")
endif

define HELP
=========================================================================================
Make Commands:

1. make buildx

    Builds the image $(DOCKERHUB_ID)/$(SERVICE_NAME):$(SERVICE_VERSION)
    for architectures: $(ARCHITECTURES)
    and publishes it to docker hub.

2. make push_readme

     Pushes README.md to Docker Hub repository $(DOCKERHUB_ID)/$(SERVICE_NAME)

3. make all

     Combination of buildx and push_readme
=========================================================================================
endef
export HELP

default:
	@echo "$$HELP"

all: buildx push_readme

buildx: login
	@echo "Create a new builder instance (docker container) ..."
	docker buildx create --use --name build --node build --driver-opt network=host	
	@echo "Starting the build ..."
	docker buildx build $(CACHING) --push --platform $(ARCHITECTURES) \
		                --tag $(DOCKERHUB_ID)/$(SERVICE_NAME):latest \
	                    --tag $(DOCKERHUB_ID)/$(SERVICE_NAME):$(SERVICE_VERSION) .

push_readme: login
	@echo "Push README.md file to Docker Hub ..."
	docker pushrm $(DOCKERHUB_ID)/$(SERVICE_NAME)

login:
	@echo "buildx requires that you must login to dockerhub in order to update readme"
	@echo "So, please enter your dockerhub access token here below."
	docker login -u $(DOCKERHUB_ID)

.PHONY: default buildx push_readme login all

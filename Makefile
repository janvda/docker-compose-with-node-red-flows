export COMPOSE_DOCKER_CLI_BUILD=0

# 2 variables below specifies the docker context for the development and build machine
DOCKER_CONTEXT_DEV=nuc1-lan
DOCKER_CONTEXT_PROD=nuc2-lan

current_docker_context:=$(shell docker context ls | grep -e "*" | cut -d ' ' -f1 )

# sets env and project_name based on current docker context.
ifeq (${current_docker_context},$(DOCKER_CONTEXT_DEV))
  env=dev
  project_name=node-red-test-dev
else ifeq (${current_docker_context},$(DOCKER_CONTEXT_PROD))
  env=prod
  project_name=node-red-test
else
  $(error "Current docker context[=$(current_docker_context)] is not '$(DOCKER_CONTEXT_DEV)' or '$(DOCKER_CONTEXT_PROD)'")
endif

compose_override=docker-compose.$(env).yml

default: current_context

current_context:
	@echo  "========================================================================================="
	@echo  "current context:"
	@echo  "    env = $(env)"
	@echo  "    current docker context = $(current_docker_context)"
	@echo  "    project_name = $(project_name)"
	@echo  "    docker_compose_override = $(compose_override)"
	@echo  "========================================================================================="
	@test -s $(compose_override) || { echo "ERROR: File $(compose_override) doesn't exist.  Exiting..." ; exit 1; }


all: 
	docker-compose -f docker-compose.yml  -f $(compose_override) -p $(project_name) up -d --build

up:
	docker-compose -f docker-compose.yml  -f $(compose_override) -p $(project_name) up -d

down stop start restart ps logs top images build:
	docker-compose -f docker-compose.yml  -f $(compose_override) -p $(project_name) $@

.PHONY: default up  build down stop start restart ps logs top images
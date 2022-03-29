current_docker_context:=`docker context ls | grep -e "*" | cut -d ' ' -f1 `
# env (environment) - possible values:
#   "dev"  - development environment (also default environment)
#   "prod" - production environment
env?=dev
project_name=my-node-red-$(env)
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
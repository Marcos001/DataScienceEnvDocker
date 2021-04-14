# -----------------------------------------
# Docker image for Data Science --------- +
# -----------------------------------------
# .
# by Marcos Vinícius
# .
# marcosvsf@ufba.br

.PHONY: help

up-pro:
	@echo "starting container in HOME PROJECTS with jupyter-lab"
	@docker-compose --env-file .envs/.home.projects up -d


up-neo:
	@echo "starting container with jupyter-lab"
	@docker-compose --env-file .env.folder up


up-neo-filter:
	@echo "starting container ds-cpu"
	@docker-compose --env-file .env.neo.filter up


up-ms-ffts:
	@echo "starting container ds-cpu"
	@docker-compose --env-file .env.neo.filter up


up-phd:
	@echo "starting container ds-cpu for PHD"
	@docker-compose --env-file .env.phd up -d


up-pet:
	@echo "starting container ds-cpu for Pet Barros"
	@docker-compose --env-file .envs/.env.pet up -d
	@docker logs ds-cpu-container

up-sc:
	@echo "starting container ds-cpu for Signal Classification"
	@docker-compose --env-file .envs/.signal.classification up -d
	@docker logs ds-cpu-container


build:
	@echo "build image r-fts"
	@docker-compose build

stop:
	@echo "stop containers"
	@docker-compose down

rm: stop
	@echo "remove r-fts image"
	@docker rmi r-fts

clean-all:
	@echo "remove ans stop all containers"
	@docker stop $(shell docker ps -aq)
	@docker rm $(shell docker ps -aq)

logs:
	@docker logs ds-cpu-container

show:
	@docker ps -a

help:
	@echo "----------------------------------------"
	@echo "+ Docker image for Data Science -------- +"
	@echo "----------------------------------------"
	@echo ""
	@echo "OPTIONS"
	@echo "1. build..: build image"
	@echo "2. stop...: stop and remove containers"
	@echo "3. clear..: remove image"

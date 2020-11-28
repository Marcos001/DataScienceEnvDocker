# -----------------------------------------
# Docker image R for Fuzzy Time Series
# -----------------------------------------
# .
# by Marcos Vinícius
# .
# marcosvsf@ufba.br

.PHONY: help

PROJECT_FOLDER = "/home/marcos/maskviewdocker/data/"

# create a make dev up UI

up-lab:
	@echo "starting container witj jupyter-lab"
	@docker run --name=r-fts-lab -p "0.0.0.0:8888:8888" \
	  -v ${PROJECT_FOLDER}:/home/fts/dynsys/ r-fts \
	   jupyter-lab --ip 0.0.0.0 --no-browser --allow-root

up:
	@echo "starting container r-fts"
	@docker run -ti -v ${PROJECT_FOLDER}:/home/fts/dynsys/ r-fts bash

build:
	@echo "build image r-fts"
	@docker-compose build

stop:
	@echo "stop containers"
	@docker-compose down

rm: stop
	@echo "remove r-fts image"
	@docker rmi r-fts

clean:
	@echo "remove ans stop all containers"
	@docker stop $(shell docker ps -aq)
	@docker rm $(shell docker ps -aq)


show:
	@docker ps -a

help:
	@echo "----------------------------------------"
	@echo "Docker image R for Fuzzy Time Series"
	@echo "----------------------------------------"
	@echo ""
	@echo "OPTIONS"
	@echo "1. build..: build image"
	@echo "2. stop...: stop and remove containers"
	@echo "3. clear..: remove image"

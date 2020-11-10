# -----------------------------------------
# Docker image R for Fuzzy Time Series 
# -----------------------------------------
# .
# by Marcos Vinícius
# .
# marcosvsf@ufba.br

.PHONY: help

up:
	@echo "starting container r-fts"
	@docker-compose up 

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
	@docker stop $(docker ps -aq)


help:
	@echo "----------------------------------------"
	@echo "Docker image R for Fuzzy Time Series"
	@echo "----------------------------------------"
	@echo ""
	@echo "OPTIONS"
	@echo "1. build..: build image"
	@echo "2. stop...: stop and remove containers"
	@echo "3. clear..: remove image"

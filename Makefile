up:
	docker-compose up -d
build:
	docker-compose build --no-cache --force-rm
init:
	@make build
	@make up
rebuild:
	@make destroy
	@make init
stop:
	docker-compose stop
down:
	docker-compose down --remove-orphans
restart:
	@make down
	@make up
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
destroy-volumes:
	docker-compose down --volumes --remove-orphans
ps:
	docker-compose ps
logs:
	docker-compose logs
logs-watch:
	docker-compose logs --follow
log-conda:
	docker-compose logs conda
log-conda-watch:
	docker-compose logs --follow conda
conda:
	docker-compose exec conda bash
ml:
	docker-compose exec conda mlflow server --host 0.0.0.0
server-list:
	docker-compose exec conda bash -c 'jupyter server list'

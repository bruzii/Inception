all: 
	mkdir -p /home/bgervais/data/mariadb
	mkdir -p /home/bgervais/data/wordpress
	@sudo docker compose -f ./srcs/docker-compose.yml build
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

clean: stop
	@-sudo docker container stop nginx mariadb wordpress
	@-sudo docker network rm inception

fclean: clean
	@sudo rm -rf /home/bgervais/data/mariadb/*
	@sudo rm -rf /home/bgervais/data/wordpress/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean
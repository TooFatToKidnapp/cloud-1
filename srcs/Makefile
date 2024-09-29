all : run

run :
	@-mkdir -p ~/data/mariadb_volume
	@-mkdir ~/data/wordpress_volume
	@docker-compose  -f  ./docker-compose.yml up --build


clean:
	@docker-compose -f ./docker-compose.yml down --remove-orphans

fclean: clean
	@rm -fr ~/data
	@-docker volume rm $$(docker volume ls -q)
	@-docker network rm $$(docker network ls -q)

re: fclean all

prune:
	@docker system prune -af 2> /dev/null

## vm makefile rules

# runvm :
# 	@-sudo mkdir -p /home/aabdou/data/mariadb_volume
# 	@-sudo mkdir /home/aabdou/data/wordpress_volume
# 	@sudo docker-compose -f ./docker-compose.yml up --build

# cleanvm:
# 	@sudo docker-compose -f ./docker-compose.yml down --remove-orphans

# fcleanvm: cleanvm
# 	@sudo rm -fr /home/aabdou/data
# 	@-sudo docker volume rm $$(sudo docker volume ls -q)
# 	@-sudo docker network rm $$(sudo docker network ls -q)

# revm: fcleanvm runvm

# prunevm:
# 	@sudo docker system prune -af 2> /dev/null

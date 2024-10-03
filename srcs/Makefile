all : run

run :
	@-mkdir -p /home/vagrant/inception/data/db
	@-mkdir /home/vagrant/inception/data/wp
	@docker-compose  -f  ./docker-compose.yml up --build -d


clean:
	@docker-compose -f ./docker-compose.yml down --remove-orphans

fclean: clean
	@rm -fr /home/vagrant/inception/data/db
	@rm -fr /home/vagrant/inception/data/wp
	@-docker volume rm $$(docker volume ls -q)
	@-docker network rm $$(docker network ls -q)

re: fclean all

prune:
	@docker system prune -af 2> /dev/null

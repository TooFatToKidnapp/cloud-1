# mariadb config

FROM debian:buster

# ARG MYSQL_USER1=${MYSQL_USER}
# ARG MYSQL_PASSWORD=${MYSQL_PASSWORD}
# ARG MYSQL_DATABASE=${MYSQL_DATABASE}

RUN apt-get --assume-yes update && apt-get --assume-yes upgrade ; \
apt-get --assume-yes install mariadb-server

COPY ./config/db-setup.sh .

RUN chmod +x db-setup.sh

CMD ["bash" , "db-setup.sh"]

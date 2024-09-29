FROM debian:buster

RUN apt-get --assume-yes update && apt-get --assume-yes upgrade

# php-fpm (fastcgi prosses manager) used to run php scripts
# php-mysql php extension that allows php to communicare with mysql databse
RUN apt-get --assume-yes install curl php7.3-fpm less php-mysql mariadb-client

COPY ./config/wp-setup.sh .
RUN chmod +x wp-setup.sh
# RUN service php7.3-fpm start
CMD ["bash", "wp-setup.sh"]

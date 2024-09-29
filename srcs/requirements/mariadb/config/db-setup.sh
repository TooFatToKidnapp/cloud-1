#!/bin/sh

# replace specific lines in the mariadb config file
sed -i '19s/.*/port                    = 3306/' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i '28s/.*/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]
then

service mysql start

sleep 5;

mysql --user=root --execute "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql --user=root --execute "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql --user=root --execute "USE '${MYSQL_DATABASE}'; GRANT ALL PRIVILEGES ON * TO '${MYSQL_USER}'@'%';"
mysql --user=root --execute "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql --user=root -p ${MYSQL_ROOT_PASSWORD} --execute "FLUSH PRIVILEGES;"

# service mysqld stop
kill $(cat /var/run/mysqld/mysqld.pid)
sleep 5;

fi

# command is used to replace the current process with a new command
# mysqld_safe is the recommended way to start mysqld server, the command \
# adds some safty features such as restarting the server when an error occurs \
# and logging runtime information to an error log
mysqld_safe

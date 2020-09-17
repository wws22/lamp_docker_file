#!/usr/bin/env bash


if [[ "_$SERVER_NAME" == "_" ]]; then
    export SERVER_NAME='localhost:80'
fi
echo "export SERVER_NAME='$SERVER_NAME'" >> /etc/apache2/envvars
echo "ServerName $SERVER_NAME" >> /etc/apache2/conf-enabled/servername.conf

# Run MySQL daemon
/usr/bin/mysqld_safe --skip-grant-tables & sleep 3

find html/db_init -name '*.sql' |xargs -I {} sh -c \
'MYSQL_DB=$(basename {} |sed -e s/\.sql//); mysql -u root -e "CREATE DATABASE $MYSQL_DB"; mysql -u root $MYSQL_DB  < "html/db_init/$MYSQL_DB.sql"'


rm -f /etc/apache2/conf-enabled/serve-cgi-bin.conf # Disable embedded /usr/lib/cgi-bin directory

# Start httpd

/etc/init.d/apache2 start && tail -f /var/log/apache2/*log
#/bin/bash

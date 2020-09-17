#!/usr/bin/env bash

docker run -d -p 8080:80 -v "$PWD/htdocs":/var/www/html --name lamp_my_perl wws22/lamp_mysql_perl
# Use: -e SERVER_NAME='www.yourdomain.com:80' to start on stage server

cat <<__EOT__
Using docker:

To built the image [Doing ONCE]:
   docker build -t wws22/lamp_mysql_perl .

Start:
    docker run -d -p 8080:80 --name lamp_my_perl -v "/path/to/folder/with/htdocs":/var/www/html wws22/lamp_mysql_perl

View:
    http://127.0.0.1:8080

Stop:
    docker kill lamp_my_perl

Cleanup:
    docker container prune -f

__EOT__
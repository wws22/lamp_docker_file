# lamp_docker_file

LAMP Dockerfile with Perl and initial MySQL dump support

Installing
==========

Install the newest version from github:

    git clone https://github.com/wws22/lamp_docker_file.git


Build the image:

    cd lamp_docker_file
    docker build -t wws22/lamp_mysql_perl .

Using
=====

Put your *.html, *.cgi and other files into htdocs/

Put your database_name.sql DUMP files into htdocs/db_init

Container will create each 'database_name' and do an export from *.sql file

Starting your server:

    docker run -d -p 8080:80 --name lamp_my_perl -v "$PWD":/var/www/html wws22/lamp_mysql_perl
    # Use: -e SERVER_NAME='www.yourdomain.com:80' to start on stage server

    Have an enjoy at: http://127.0.0.1:8080

Stop the server:

    docker kill lamp_my_perl

Cleanup unused containers:

    docker container prune -f


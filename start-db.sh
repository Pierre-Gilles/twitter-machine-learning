#!/bin/bash

docker stop some-mysql
docker rm some-mysql

docker run --name some-mysql -v /var/lib/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=twitter-machine-learning -d twitter-machine-learning/mysql

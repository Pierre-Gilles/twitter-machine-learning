#!/bin/bash

docker stop node-twitter-machine-learning
docker rm node-twitter-machine-learning

docker stop some-mysql
docker rm some-mysql

docker run --name some-mysql -v /var/lib/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root MYSQL_DATABASE=twitter-machine-learning -d mysql:latest
docker run --name node-twitter-machine-learning --restart=always --link some-postgres:postgres -d twitter-machine-learning/node
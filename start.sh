#!/bin/bash

docker stop node-twitter-machine-learning
docker rm node-twitter-machine-learning

docker stop some-mysql
docker rm some-mysql

docker run --name some-mysql -v /var/lib/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=twitter-machine-learning -d twitter-machine-learning/mysql
docker run --name node-twitter-machine-learning --restart=always --link some-mysql:mysql -d twitter-machine-learning/node
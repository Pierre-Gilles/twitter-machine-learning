#!/bin/bash

docker stop node-twitter-machine-learning
docker rm node-twitter-machine-learning
docker run --name node-twitter-machine-learning --restart=always --link some-mysql:mysql -d twitter-machine-learning/node
#!/usr/bin/env sh

docker build -t hongtianjun/python3 .
docker tag hongtianjun/python3 114.116.53.131:8085/hongtianjun/python3
docker push 114.116.53.131:8085/hongtianjun/python3
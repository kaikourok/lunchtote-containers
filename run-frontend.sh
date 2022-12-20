#!/bin/bash

cd `dirname $0`

docker-compose exec frontend npm run build 
docker-compose exec frontend npm run start
#!/bin/bash

cd `dirname $0`

docker-compose exec frontend npm run build 
docker-compose exec frontend npm run start

while true
do
  echo "終了するにはexitと入力してください。"
  read EXIT_CONFIRM
  if [ $EXIT_CONFIRM == "exit" ]; then
    break
  fi
done
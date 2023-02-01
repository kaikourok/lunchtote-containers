#!/bin/bash

cd `dirname $0`

BACKEND_INIT_BRANCH=develop
FRONTEND_INIT_BRANCH=develop

function docker_compose_exec {
# GitBash for Windows(mintty)のときはdocker-compose exec時にwinptyをつけるように
# 条件的にはwinptyコマンドの有無で判定
  if type "winpty" > /dev/null 2>&1; then
    winpty docker-compose exec $@
  else
    docker-compose exec $@
  fi
}

docker-compose up -d

docker-compose exec backend bash -c "chmod -R 600 /root/.ssh"
docker_compose_exec backend git init
docker_compose_exec backend git remote add origin git@github.com:kaikourok/lunchtote-backend.git
docker_compose_exec backend git fetch origin ${BACKEND_INIT_BRANCH}
docker_compose_exec backend git checkout ${BACKEND_INIT_BRANCH}
docker_compose_exec backend make dev-deps
docker_compose_exec backend make init

docker-compose exec frontend bash -c "chmod -R 600 /root/.ssh"
docker_compose_exec frontend git init
docker_compose_exec frontend git remote add origin git@github.com:kaikourok/lunchtote-frontend.git
docker_compose_exec frontend git fetch origin ${FRONTEND_INIT_BRANCH}
docker_compose_exec frontend git checkout ${FRONTEND_INIT_BRANCH}
docker_compose_exec frontend npm install

echo "環境構築が完了しました。"

while true
do
  echo "終了するにはexitと入力してください。"
  read EXIT_CONFIRM
  if [ $EXIT_CONFIRM == "exit" ]; then
    break
  fi
done
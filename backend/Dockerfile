FROM golang:latest

RUN apt-get update && apt-get install -y git ssh

WORKDIR /app

RUN go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
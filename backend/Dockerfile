FROM golang:latest

RUN apt-get update && apt-get install -y git ssh

WORKDIR /app

RUN go install github.com/cosmtrek/air@latest
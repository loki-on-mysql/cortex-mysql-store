#!/bin/bash

cd grpc/ && protoc  --go_out=plugins=grpc:. *.proto && cd ..
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags '-extldflags "-static"' -o bin/cortex-mysql-store .

docker build -t holdnowby/cortex-mysql-store:v0.0.2 .
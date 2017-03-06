#!/bin/sh
mkdir build
go build -o buildserver server/server.go
docker build -t fluux-go-tmpl -f Dockerfile .

#!/bin/bash
cd ./modules/dandanplay-gocli || exit
cat main.go | sed "s/your_app_id/${DANDANPLAY_APPID}/g" | sed "s/your_app_secret/${DANDANPLAY_APPSECRET}/g" > main_secret.go
go build -ldflags="-s -w" -o dandanplay main_secret.go
upx --best --lzma dandanplay
cd ../..
ln -sf ../../modules/dandanplay-gocli/dandanplay ./bin/dandanplay/dandanplay


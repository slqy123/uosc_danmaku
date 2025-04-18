#!/bin/bash
git submodule update --init --recursive
pushd .
cd ./modules/dandanplay-gocli || exit
sed "s/your_app_id/${DANDANPLAY_APPID}/g" < main.go | sed "s/your_app_secret/${DANDANPLAY_APPSECRET}/g" > main_secret.go
go build -ldflags="-s -w" -o dandanplay main_secret.go
upx --best --lzma dandanplay
popd || exit

mv ./modules/dandanplay-gocli/dandanplay ./bin/dandanplay


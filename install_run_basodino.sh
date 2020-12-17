#!/bin/bash

apt-get update && apt-get upgrade -y
apt install unzip
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
apt-get install -y nodejs
wget https://github.com/hoprnet/hopr-chat/releases/download/v1.17.14-basodino-testnet/hopr-chat-nodebin-linux.zip
unzip hopr-chat-nodebin-linux.zip
rm -f hopr-chat-nodebin-linux.zip
cd hopr-chat/
./start-hopr-chat.sh

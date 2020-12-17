#!/bin/bash

apt-get update && apt-get upgrade -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
apt-get install -y nodejs
npm install --unsafe-perm=true -g @hoprnet/hoprd@1.57.7
DEBUG=hopr* hoprd --init --admin

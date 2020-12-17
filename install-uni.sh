#!/bin/bash

echo Hello, what release are you installing? Format: X.XX.X
read vrelease
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt -y  install gcc g++ make
sudo apt -y install nodejs
sudo npm install --unsafe-perm=true -g @hoprnet/hoprd@$vrelease
DEBUG=hopr*,libp2p:mplex:stream hoprd --init --rest --admin 2> hopr.log.txt

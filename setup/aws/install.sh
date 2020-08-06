#!/usr/bin/env bash

set -e
set -x

sudo apt update -y
sudo apt install -y nmap
sudo apt install -y jq
sudo apt install -y nginx
sudo apt install -y letsencrypt

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

nvm i 8
nvm i 10
nvm i 12
nvm alias default 8

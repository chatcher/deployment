#!/usr/bin/env bash

set -x

echo "Installing a bunch of stuff"
sudo apt update
sudo apt install -y nmap
sudo apt install -y nano
sudo apt install -y git
sudo apt install -y gnupg
sudo apt install -y jq
sudo apt install -y dnsutils
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# this might fail because nvm might not be available in the current shell
nvm install 8
nvm install 10
nvm install 12

echo
echo "Configuring some stuff"
git config --global user.name "Chad Hatcher"
git config --global user.email "hackenslacker@gmail.com"
mkdir .ssh && chmod 700 .ssh && ssh-keygen
cat .ssh/*pub

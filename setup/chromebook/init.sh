#!/usr/bin/env bash

set -x

echo "Installing a bunch of stuff"
sudo apt update
sudo apt install nmap
sudo apt install nano
sudo apt install git
sudo apt install gnupg
sudo apt install jq
sudo apt install colordiff
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# this might fail because nvm might not be available in the current shell
nvm install 8
nvm install 10
nvm install 12

echo
echo "Configuring some stuff"
mkdir .ssh && chmod 700 .ssh && ssh-keygen
cat .ssh/*pub
git config --global user.name "Chad Hatcher"
git config --global user.email "hackenslacker@gmail.com"
gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG

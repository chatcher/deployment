#!/usr/bin/env bash

set -x

echo "Installing a bunch of stuff" >&2
sudo apt update
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y nmap
sudo apt install -y nano
sudo apt install -y git
sudo apt install -y gnupg
sudo apt install -y jq
sudo apt install -y dnsutils
sudo apt install -y rsync
sudo apt install -y whois
sudo apt install -y sublime-text
sudo apt install -y sublime-merge
mkdir "${HOME}/.nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# this might fail because nvm might not be available in the current shell
nvm install 8
nvm install 10
nvm install 12
nvm install 14

echo
echo "Download .bashrc"
if [ -f "${HOME}/.bashrc" ]; then
	mv "${HOME}/.bashrc" "${HOME}/.bashrc.bak"
fi
curl https://raw.githubusercontent.com/chatcher/deployment/master/setup/chromebook/.bashrc > "${HOME}/.bashrc"

echo >&2
echo "Configuring some stuff" >&2
git config --global user.name "Chad Hatcher"
git config --global user.email "hackenslacker@gmail.com"
git config --global diff.wsErrorHighlight all
mkdir "${HOME}/.ssh" && chmod 700 "${HOME}/.ssh" && ssh-keygen

echo >&2
cat "${HOME}/.ssh/*pub"

echo >&2
echo -e "If that worked, then paste that into github or whatever." >&2

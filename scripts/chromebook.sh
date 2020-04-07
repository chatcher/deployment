sudo apt update
sudo apt install nano
sudo apt install git
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
mkdir .ssh && chmod 700 .ssh && ssh-keygen
nvm install 8; nvm install 10; nvm install 12; nvm use 10
cat .ssh/*pub
git config --global user.name "Chad Hatcher"
git config --global user.email "hackenslacker@gmail.com"
sudo apt install gnupg
gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG

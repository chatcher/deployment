#!/usr/bin/env bash

open 'https://download.docker.com/mac/stable/Docker.dmg'
open 'https://desktop.github.com/'
open 'https://www.sublimetext.com/3'
open 'https://www.sublimemerge.com/'
open 'https://sequelpro.com/download#auto-start'

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install bash # because default v3 does not have associative arrays
brew install dos2unix # to fix line endings more easily
brew install jq # because JSON
brew install node@10
brew install nvm # because node/npm
brew install pgcli # postgres client
brew install shellcheck # to lint shell scripts

nvm use system
npm i -g eslint

nvm install 8
nvm install 10
nvm install 12

nvm alias default=8

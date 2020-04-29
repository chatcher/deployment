#!/usr/bin/env bash

open 'https://download.docker.com/mac/stable/Docker.dmg'
open 'https://desktop.github.com/'
open 'https://www.sublimetext.com/3'
open 'https://www.sublimemerge.com/'

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install nvm

brew cask install homebrew/cask-versions/adoptopenjdk8

brew install jenkins-lts
#brew services start jenkins-lts

nvm install 10
nvm install 12


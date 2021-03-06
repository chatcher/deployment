#!/usr/bin/env zsh

if [ -f "${HOME}/.env" ]; then source "${HOME}/.env"; fi

export PATH="$PATH:/usr/local/opt/node@10/bin"

export GITHUB_TOKEN='c41727b5c47646b72a47ecf15607fd4790143228'

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
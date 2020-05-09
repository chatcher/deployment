#!/usr/bin/env zsh

HISTSIZE=1000
SAVEHIST=1000
HISTFILESIZE=10000
HISTORY_IGNORE="(l[ls]|l[ls] *)"

setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

###

export EDITOR='nano'
export VISUAL='nano'

color_defs="${HOME}/deployment/src/color-defs.sh"
if [ -f "${color_defs}" ]; then source "${color_defs}"; fi

if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

alias ll='ls -laphGF'

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version
  local nvmrc_path

  node_version="$(nvm version)"
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version

    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

precmd() {
	print -rP '%(?.%F{green}√.%F{red}%?) %{%F{8}%}[%D %T]'
}
PS1='%{%F{8}%}[!%h] %{%F{14}%}%~ %{%F{10}%}%# %f'

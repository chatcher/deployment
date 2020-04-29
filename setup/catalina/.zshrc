# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE=history*:ll

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

###

export EDITOR='nano'
export VISUAL='nano'

if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

alias ll='ls -la'

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

precmd() { print -rP '%(?.%F{green}√.%F{red}%?) %{%F{8}%}[%D %T]' }
PS1='%{%F{8}%}[!%h] %{%F{14}%}%~ %{%F{10}%}%# %f'

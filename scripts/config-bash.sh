#!/usr/bin/env bash

no_color="\\[\033[m\\]"
dim_color="\\[\033[90m\\]"
green_color="\\[\033[92m\\]"
blue_color="\\[\033[96m\\]"

date_str='[\t]'
chroot_str="${debian_chroot:+($debian_chroot)}"
path_str='\w'
prompt_str='\$ '

line1="${dim_color}${date_str} ${chroot_str}${blue_color}${path_str}${no_color}"
line2="${dim_color}${green_color}${prompt_str}${no_color}"

#ps1_str='PS1="${chroot_str}\[\033[01;32m\]\u@\h\[\033[00m\]
#:\[\033[01;34m\]\w\[\033[00m\]\$ "'

ps1_str="\n${line1}\n${line2}"

export PS1="${ps1_str}"

echo >> ~/.bashrc
echo "PS1='${ps1_str}'" >> ~/.bashrc

#!/usr/bin/env bash

set -e
set -x

pem_file="${1}"
aws_host="${2}"

if [ -z "${pem_file}" ]; then read -p "PEM file: " -r pem_file; fi
if [ -z "${pem_file}" ] || [ ! -f "${pem_file}" ]; then 
	echo "PEM file required." >&2
	exit 1
fi

if [ -z "${aws_host}" ]; then read -p "AWS host: " -r aws_host; fi
if [ -z "${aws_host}" ]; then
	echo "AWS host required." >&2
	exit 1
fi

# Upload public key to remote server.
rcp -i "${pem_file}" "${HOME}/.ssh/id_rsa.pub" "ubuntu@${aws_host}:$(whoami).id_rsa.pub"

# Create self and set up SSH access.
ssh -i "${pem_file}" "ubuntu@${aws_host}" -t "
 set -e
 sudo adduser --disabled-password --home '/home/$(whoami)/' --gecos '' '$(whoami)'
 sudo usermod -a -g sudo '$(whoami)'
 sudo passwd -de '$(whoami)'
 sudo passwd '$(whoami)'
 sudo su -c 'mkdir /home/$(whoami)/.ssh'
 sudo mv '/home/ubuntu/$(whoami).id_rsa.pub' '/home/$(whoami)/.ssh/authorized_keys' 
 sudo chown '$(whoami):$(whoami)' '/home/$(whoami)/.ssh/authorized_keys' 
 sudo su -c 'chmod 600 /home/$(whoami)/.ssh/authorized_keys'
 sudo su -c 'chmod 700 /home/$(whoami)/.ssh'
"

# Create new key-pair and disable ubuntu user
ssh "${aws_host}" -t "
 ssh-keygen -b 4096 -t rsa -N '' -f /home/$(whoami)/.ssh/id_rsa
 cat /home/$(whoami)/.ssh/id_rsa.pub
"

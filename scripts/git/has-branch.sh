#!/usr/bin/env bash

usage() {
	echo "  test whether <branch> exists locally or on the remote" >&2
	echo "usage:" >&2
	echo "  $(basename $0) <branch>" >&2

	if ! [ -z "$1" ]; then echo "error: ${1}" >&2; fi

	exit 1
}

if [ -z "${1}" ]; then usage "<branch> required"; fi

./has-local-branch.sh "${1}" || ./has-remote-branch.sh "${1}"

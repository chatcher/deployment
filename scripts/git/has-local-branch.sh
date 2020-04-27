#!/usr/bin/env bash

usage() {
	echo "  test whether <branch> exists on the remote" >&2
	echo "usage:" >&2
	echo "  ${0#*/} <branch>" >&2

	if ! [ -z "$1" ]; then echo "error: ${1}" >&2; fi

	exit 1
}

if [ -z "${1}" ]; then usage "<branch> required"; fi

while read -u 3 line; do
	clean="${line#* }"
	branch="${clean#remotes/origin/}"
	if [ "${branch}" == "${1}" ]; then
		exit
	fi
done 3<<<"$(git branch)"

exit 1

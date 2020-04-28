#!/usr/bin/env bash

usage() {
	echo "  test whether <branch> exists on the remote" >&2
	echo "usage:" >&2
	echo "  $(basename $0) <branch>" >&2

	if ! [ -z "$1" ]; then echo "error: ${1}" >&2; fi

	exit 1
}

if [ -z "${1}" ]; then usage "<branch> required"; fi

git fetch -p &>/dev/null

while read -u 3 line; do
	clean="${line#* }"
	branch="${clean#origin/}"
	if [ "${branch}" == "${1}" ]; then
		exit
	fi
done 3<<<"$(git branch -r)"

exit 1

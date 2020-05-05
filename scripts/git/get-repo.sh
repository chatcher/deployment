#!/usr/bin/env bash

usage() {
	echo "usage:" >&2
	echo "  $(basename "${0}")" >&2

	if ! [ -z "${1}" ]; then echo "error: ${1}" >&2; fi

	exit 1
}

while ! [ -d '.git' ] && [ "$(pwd)" != '/' ]; do
	cd ..
done

if ! [ -d '.git' ]; then
	echo 'No .git directory found in path; better luck next time.' >&2
	exit 1
fi

url_opt="$(grep git@github .git/config)"
repo="$(sed -E -e 's/.*://' -e 's/.git$//' <<< "${url_opt}")"

echo "${repo}" >&1

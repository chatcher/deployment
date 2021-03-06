#!/usr/bin/env bash

usage() {
	echo "Change to specified branch, if it exists" >&2
	echo "usage:" >&2
	echo "  $(basename "${0}") <branch>" >&2

	if [ -n "${1}" ]; then echo -e "${A_CS} error: ${1} ${N_CS}" >&2; fi

	exit 1
}

if [ -z "${1}" ]; then usage "branch is required"; fi

branch="$(./current-branch.sh)"

if ./has-branch.sh "${1}"; then
	git checkout "${1}" >&2
else
	git checkout -b "${1}" >&2
fi

if [[ "${branch}" =~ / ]]; then
	git branch -d "${branch}" >&2
else
	echo "keeping old [${branch}]" >&2
fi


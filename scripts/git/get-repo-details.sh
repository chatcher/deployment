#!/usr/bin/env bash

repo="$(./get-repo.sh)"

if [ -z "${repo}" ]; then
	echo 'Failed to discern repo name.' >&2
	exit 1
fi

auth_header="Authorization: token ${GITHUB_TOKEN}"
curl -H "${auth_header}" "https://api.github.com/repos/${repo}" -s | jq

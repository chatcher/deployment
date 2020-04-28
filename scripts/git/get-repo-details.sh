#!/usr/bin/env bash

. ~/.github

repo="$(./get-repo.sh)"

if [ -z "${repo}" ]; then
	echo 'Failed to discern repo name.' >&2
	exit 1
fi

auth_header="Authorization: token ${github_access_token}"
curl -H "${auth_header}" "https://api.github.com/repos/${repo}" -s | jq

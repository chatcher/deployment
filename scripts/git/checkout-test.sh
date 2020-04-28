#!/usr/bin/env bash

echo -e "\033[33m  no arg:\033[m"
./checkout.sh
echo '-----'
echo -e "\033[33m  master:\033[m"
./checkout.sh master
echo '-----'
echo -e "\033[33m  new branch\033[m"
branch="temp-$(date +%s)"
./checkout.sh "${branch}"
echo '-----'
echo -e "\033[90m  cleaning up...\033[m"
git checkout master
git branch -d "${branch}"



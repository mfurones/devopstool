#!/bin/bash

echo "--- Install GitHub ---"
### https://github.com/cli/cli/blob/trunk/docs/install_linux.md

echo "--- Keyrings activities ---"
mkdir -p -m 755 /etc/apt/keyrings
out=$(mktemp) && wget -nv -O $out https://cli.github.com/packages/githubcli-archive-keyring.gpg
cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg

echo "--- Add GitHub CLI to APT ---"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null

echo "--- APT update ---"
apt update

echo "--- Install Github CLI ---"
apt install gh -y

echo "--- Cleanup ---"
rm -rf $out

echo "--- End Install GitHub ---"

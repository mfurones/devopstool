#!/bin/bash

echo "--- Install GitHub ---"
### https://github.com/cli/cli/blob/trunk/docs/install_linux.md

echo "--- Add GitHub CLI to microdnf ---"
microdnf install dnf5-plugins
microdnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
microdnf install -y gh --repo gh-cli

echo "--- microdnf update ---"
microdnf update

echo "--- Install Github CLI ---"
microdnf install -y gh

echo "--- End Install GitHub ---"

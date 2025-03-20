#!/bin/bash

echo "--- Install AZ CLI ---"
### https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt

echo "--- Download & Install AZ CLI ---"
curl -sL https://aka.ms/InstallAzureCLIDeb | bash


### Extensions

echo "--- AZ devops CLI extension ---"
### https://learn.microsoft.com/en-us/azure/devops/cli/?view=azure-devops
az extension add --name azure-devops

echo "--- Clean source List ---"
rm -f /etc/apt/sources.list.d/azure-cli.list
rm -f /etc/apt/sources.list.d/azure-cli.list.save

echo "--- End Install AZ CLI ---"

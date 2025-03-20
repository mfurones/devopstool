#!/bin/bash

echo "--- Install AZ CLI ---"
### https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt

echo "--- Download MS keys ---"
rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo "--- Download AZ CLI ---"
microdnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm

echo "--- Install AZ CLI ---"
microdnf install -y azure-cli

### Extensions

echo "--- AZ devops CLI extension ---"
### https://learn.microsoft.com/en-us/azure/devops/cli/?view=azure-devops
az extension add --name azure-devops

echo "--- End Install AZ CLI ---"

#!/bin/bash

echo "--- Install Kubectl ---"
### https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

echo "--- Download Kubectl ---"
curl -LO https://dl.k8s.io/release/v1.32.0/bin/linux/amd64/kubectl

echo "--- Install Kubectl ---"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "--- Cleanup ---"
rm -f kubectl

echo "--- End Install Kubectl ---"

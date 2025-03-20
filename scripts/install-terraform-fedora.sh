#!/bin/bash

echo "--- Install Terraform ---"
### https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli


echo "--- Install dependencies ---"
microdnf install -y dnf-plugins-core

echo "--- Config repo ---"
microdnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo

echo "--- Install Terraform ---"
microdnf -y install terraform


### Providers

echo "--- Download Databricks Terraform Provider. ---"
wget -P /tmp/ https://github.com/databricks/terraform-provider-databricks/releases/download/v1.62.0/terraform-provider-databricks_1.62.0_linux_amd64.zip --no-check-certificate

echo "--- unzip terraform-provider-databricks ---"
unzip /tmp/terraform-provider-databricks_1.62.0_linux_amd64.zip -d /tmp || true

echo "--- Move terraform-provider-databricks to ~/.terraform.d/plugins/registry.terraform.io/databricks/databricks/1.62.0/linux_amd64/ ---"
mkdir -p ~/.terraform.d/plugins/registry.terraform.io/databricks/databricks/1.62.0/linux_amd64
cp /tmp/terraform-provider-databricks_v1.62.0 ~/.terraform.d/plugins/registry.terraform.io/databricks/databricks/1.62.0/linux_amd64/ || true

echo "--- End Install Terraform ---"

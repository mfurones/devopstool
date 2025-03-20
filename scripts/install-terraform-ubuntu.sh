#!/bin/bash

echo "--- Install Terraform ---"
### https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

echo "--- Install dependencies ---"
apt-get install -y gnupg software-properties-common

echo "--- Install keyrings ---"
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

echo "--- Add APT source list ---"
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

echo "--- APT update ---"
apt update

echo "--- APT update ---"
apt-get install -y terraform


### Providers

echo "--- Download Databricks Terraform Provider. ---"
wget -P /tmp/ https://github.com/databricks/terraform-provider-databricks/releases/download/v1.62.0/terraform-provider-databricks_1.62.0_linux_amd64.zip --no-check-certificate

echo "--- unzip terraform-provider-databricks ---"
unzip /tmp/terraform-provider-databricks_1.62.0_linux_amd64.zip -d /tmp || true

echo "--- Move terraform-provider-databricks to ~/.terraform.d/plugins/registry.terraform.io/databricks/databricks/1.62.0/linux_amd64/ ---"
mkdir -p ~/.terraform.d/plugins/registry.terraform.io/databricks/databricks/1.62.0/linux_amd64
cp /tmp/terraform-provider-databricks_v1.62.0 ~/.terraform.d/plugins/registry.terraform.io/databricks/databricks/1.62.0/linux_amd64/ || true

echo "--- Cleanup ---"
rm -rf /etc/apt/sources.list.d/hashicorp.list

echo "--- End Install Terraform ---"

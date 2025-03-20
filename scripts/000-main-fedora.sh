#!/bin/bash

### ADO Host Software
## https://github.com/actions/runner-images/blob/main/images/ubuntu/Ubuntu2204-Readme.md

## Load functions
source ../requirements/versions.txt

## Install programs
bash config-OS.sh
bash update-microdnf.sh

## Install programs
bash install-common-fedora.sh
bash install-powershell-fedora.sh
bash install-python-fedora.sh
bash update-pip-upgrade.sh
bash install-git-fedora.sh
bash install-az-cli-fedora.sh
bash install-jfrog-cli.sh
bash install-github-cli-fedora.sh
bash install-databricks-cli.sh
bash install-terraform-fedora.sh
bash install-ansible-fedora.sh
bash install-kubectl.sh

## through PIP
bash install-awxkit.sh

## through Powershell
pwsh install-pester.ps1

## post install
bash cleanup-common.sh

## Invoke tests programs
pwsh -Command "Invoke-Pester -Script '100-main.Tests.ps1' -OutputFormat NUnitXml -OutputFile /home/TestResults-fedora.xml"
pwsh -Command "Invoke-Pester -Script '100-main.Tests.ps1' -Output Detailed" > /home/TestResults-fedora.txt

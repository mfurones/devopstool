#!/bin/bash

### ADO Host Software
## https://github.com/actions/runner-images/blob/main/images/ubuntu/Ubuntu2204-Readme.md

# source ../requirements/versions.txt
#
## Install programs
bash config-OS.sh
bash update-apt.sh

## Install programs
bash install-common-ubuntu.sh
bash install-powershell-ubuntu.sh
bash install-python-ubuntu.sh
bash update-pip-upgrade.sh
bash install-git-ubuntu.sh
bash install-az-cli-ubuntu.sh
bash install-jfrog-cli.sh
bash install-github-cli-ubuntu.sh
bash install-databricks-cli.sh
bash install-terraform-ubuntu.sh
bash install-ansible-ubuntu.sh
bash install-kubectl.sh

## through PIP
bash install-awxkit.sh

## through Powershell
pwsh install-pester.ps1

## post install
bash cleanup-common.sh
bash cleanup-ubuntu.sh

## Invoke tests programs
pwsh -Command "Invoke-Pester -Script '100-main.Tests.ps1' -OutputFormat NUnitXml -OutputFile /home/TestResults-ubuntu.xml"
pwsh -Command "Invoke-Pester -Script '100-main.Tests.ps1' -Output Detailed" > /home/TestResults-ubuntu.txt



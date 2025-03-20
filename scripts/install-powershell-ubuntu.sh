#!/bin/bash

echo "--- Install powershell ---"
## https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.4

echo "--- Install prerequisites ---"
apt-get install -y apt-transport-https software-properties-common

source /etc/os-release

echo "--- Download the Microsoft repository keys ---"
wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb

echo "--- Install the Microsoft repository keys ---"
dpkg -i packages-microsoft-prod.deb

echo "--- Remove files ---"
rm packages-microsoft-prod.deb

echo "--- APT update ---"
apt-get update

echo "--- Install PowerShell ---"
apt-get install -y powershell

echo "--- End Install powershell ---"

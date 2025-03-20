#!/bin/bash

echo "--- Install powershell ---"
## https://learn.microsoft.com/en-us/powershell/scripting/install/install-rhel?view=powershell-7.4

echo "--- Download & install powershell ---"
microdnf install -y https://github.com/PowerShell/PowerShell/releases/download/v7.4.6/powershell-7.4.6-1.rh.x86_64.rpm

echo "--- End Install powershell ---"


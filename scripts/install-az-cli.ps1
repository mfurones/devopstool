param(
    [string]$version,
    [string]$osVersion,
    [string]$osName,
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install AZ CLI ---"
### https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt

Write-Host "--- Pre-Requisites ---"
apt-get update
apt-get install apt-transport-https ca-certificates curl gnupg lsb-release

Write-Host "--- Repo Keys ---"
$msUrl = "https://packages.microsoft.com/keys/microsoft.asc"
New-Item -ItemType Directory -Path "/etc/apt/keyrings" -Force | Out-Null
curl -sLS $msUrl | gpg --dearmor | tee /etc/apt/keyrings/microsoft.gpg > /dev/null
chmod go+r /etc/apt/keyrings/microsoft.gpg

Write-Host "--- Source ---"
$azDist = (lsb_release -cs).Trim()
$architecture = (dpkg --print-architecture).Trim()
$content = @"
Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: $($osName)
Components: main
Architectures: $architecture
Signed-by: /etc/apt/keyrings/microsoft.gpg
"@
Set-Content -Path "/etc/apt/sources.list.d/azure-cli.sources" -Value $content

Write-Host "--- Update ---"
apt-get update

Write-Host "--- Install CLI ---"
apt-get install "azure-cli=$($version)-1~$($osName)"

### extensions azure-devops

Write-Host "--- AZ devops CLI extension ---"
### https://learn.microsoft.com/en-us/azure/devops/cli/?view=azure-devops
az extension add --name azure-devops

Write-Host "--- Clean source List ---"
rm -f /etc/apt/sources.list.d/azure-cli.list
rm -f /etc/apt/sources.list.d/azure-cli.list.save

Write-Host "--- Verify ---"

$vRaw = az --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "Azure CLI: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install AZ CLI ---"

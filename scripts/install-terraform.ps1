param(
    
    [string]$version,
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install Terraform ---"
# https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

Write-Host "--- Install dependencies ---"

apt-get install -y gnupg software-properties-common

Write-Host "--- Install keyrings ---"

New-Item -ItemType Directory -Path "/usr/share/keyrings" -Force | Out-Null

wget -qO- https://apt.releases.hashicorp.com/gpg |
    gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

Write-Host "--- Add APT source list ---"

$osName = (lsb_release -cs).Trim()

Set-Content `
    -Path "/etc/apt/sources.list.d/hashicorp.list" `
    -Value "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $osName main"

Write-Host "--- APT update ---"

apt-get update

Write-Host "--- Install Terraform ---"

apt-get install -y "terraform=$($version)"

Write-Host "--- Verify ---"

$vRaw = terraform --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "Terraform: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install Terraform ---"

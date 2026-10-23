param(
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install Checkov ---"
# https://www.checkov.io/

pipx install checkov

Write-Host "--- Create symbolic link ---"
New-Item -ItemType SymbolicLink -Path "/usr/local/bin/checkov" -Target "/root/.local/bin/checkov" -Force | Out-Null

Write-Host "--- Verify ---"

$vRaw = & checkov --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "Checkov : $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install Checkov ---"

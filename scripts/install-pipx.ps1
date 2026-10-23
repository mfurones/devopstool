param(
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install PIPX ---"

Write-Host "--- Install package ---"

apt-get install -y pipx

Write-Host "--- Verify ---"
pipx --version

Write-Host "--- Verify ---"

$vRaw = pipx --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "PIPX: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install PIPX ---"
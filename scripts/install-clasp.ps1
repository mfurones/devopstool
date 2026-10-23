param(
    
    [string]$version = "latest",
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install Clasp ---"

npm install -g "@google/clasp@$($version)"


Write-Host "--- Verify ---"

$vRaw = clasp --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "Clasp: $version"
$content | Add-Content -Path $versionPath -Encoding utf8

Write-Host "--- $content ---"

Write-Host "--- End Installing Clasp ---"
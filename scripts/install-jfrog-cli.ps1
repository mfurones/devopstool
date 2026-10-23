param(    
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install JFrog ---"
# https://docs.jfrog.com/integrations/docs/download-and-install-the-jfrog-cli

& curl -k -fL https://install-cli.jfrog.io | & sh

Write-Host "--- Verify ---"

$vRaw = jf --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "Jfrog: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install JFrog ---"
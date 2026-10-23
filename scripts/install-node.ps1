param(
    
    [string]$version,
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install NodeJS & npm ---"

#apt-get install -y curl ca-certificates

Write-Host "--- Download package ---"

bash -c "curl -fsSL https://deb.nodesource.com/setup_$($version).x | bash -"

Write-Host "--- Install NodeJS ---"

apt-get install -y nodejs

Write-Host "--- Verify ---"

$vRaw = node -v
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "NodeJS: $version"
$content | Add-Content -Path $versionPath -Encoding utf8

Write-Host "--- $content ---"

$vRaw = npm -v
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "NPM: $version"
$content | Add-Content -Path $versionPath -Encoding utf8

Write-Host "--- $content ---"

Write-Host "--- End Installing NodeJS & npm ---"


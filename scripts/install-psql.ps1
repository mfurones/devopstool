param(
    [string]$version,
    [string]$osVersion,
    [string]$osName,
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install PostgreSQL Client ---"
# https://www.postgresql.org/download/linux/ubuntu/

Write-Host "--- Install repository key ---"

New-Item -ItemType Directory -Path "/usr/share/keyrings" -Force | Out-Null

$url = "https://www.postgresql.org/media/keys/ACCC4CF8.asc"
curl -fsSL $url | gpg --dearmor -o /usr/share/keyrings/postgresql.gpg

Write-Host "--- Add APT source ---"

$contentPath = "/etc/apt/sources.list.d/pgdg.list"
$contentValue = "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt $($osName)-pgdg main"
Set-Content -Path $contentPath -Value $contentValue

Write-Host "--- APT update ---"

apt-get update

Write-Host "--- Install PostgreSQL Client ---"

apt-get install -y "postgresql-client-$($version)"

Write-Host "--- Cleanup ---"

Remove-Item $contentPath -Force -ErrorAction SilentlyContinue

Write-Host "--- Verify ---"

$vRaw = psql --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+(?:\.\d+)?').Matches[0].Value
$content = "PSQL: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install PostgreSQL Client ---"
param(
    [string]$version,
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Installing Python ---"
apt install -y "python$($version)" "python$($version)-venv"

Write-Host "--- Creating Python symbolic link ---"
New-Item -ItemType SymbolicLink -Path "/usr/local/bin/python" -Target "/usr/bin/python$version" -Force | Out-Null

Write-Host "--- Verify ---"

$vRaw = python --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "Python: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Installing Python ---"



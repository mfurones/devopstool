param(
    [version]$version,
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Installing PIP ---"
apt install -y "python$($version.Major)-pip"

Write-Host "--- PIP update ---"
python -m pip install --upgrade pip

Write-Host "--- Creating Python symbolic link ---"
New-Item -ItemType SymbolicLink -Path "/usr/local/bin/pip" -Target "/usr/bin/pip" -Force | Out-Null

New-Item -ItemType SymbolicLink -Path "/usr/local/bin/pip" -Target "/usr/bin/pip3" -Force | Out-Null

Write-Host "--- Verify ---"

$vRaw = pip --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+(?:\.\d+)?').Matches[0].Value
$content = "PIP: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End PIP update ---"


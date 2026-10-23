param(
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install GitHub ---"
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md

Write-Host "--- Keyrings activities ---"

New-Item -ItemType Directory -Path "/etc/apt/keyrings" -Force | Out-Null

wget -nv -O /etc/apt/keyrings/githubcli-archive-keyring.gpg https://cli.github.com/packages/githubcli-archive-keyring.gpg

chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg

Write-Host "--- Add GitHub CLI to APT ---"

$architecture = (dpkg --print-architecture).Trim()

$contentPath = "/etc/apt/sources.list.d/github-cli.list"
$contentValue = "deb [arch=$architecture signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main"
Set-Content -Path $contentPath -Value $contentValue

Write-Host "--- APT update ---"

apt-get update

Write-Host "--- Install GitHub CLI ---"

apt-get install -y gh

Write-Host "--- Verify ---"

$vRaw = gh --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "GitHub: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install GitHub ---"
param(
    [string]$version,
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install GCP CLI ---"
# https://cloud.google.com/sdk/docs/install

Write-Host "--- Repository ---"

$contentPath = "/etc/apt/sources.list.d/google-cloud-sdk.list"
$contentValue = "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main"
Set-Content -Path $repoPath -Value $contentValue

Write-Host "--- GPG Key ---"

New-Item -ItemType Directory -Path "/usr/share/keyrings" -Force | Out-Null
scurl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

Write-Host "--- Install GCP CLI ---"

apt-get update
apt-get install -y "google-cloud-cli=$($version)-0"

Write-Host "--- Verify ---"

$vRaw = gcloud --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "GCP: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"


Write-Host "--- End Install GCP CLI ---"

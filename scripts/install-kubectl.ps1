param(
    [string]$version,
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install Kubectl ---"
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

$url = "https://dl.k8s.io/release/v$version/bin/linux/amd64/kubectl"
$tempFile = "/tmp/kubectl"

Write-Host "--- Download Kubectl ---"

curl -fL -o $tempFile $url

Write-Host "--- Install Kubectl ---"

install -o root -g root -m 0755 $tempFile /usr/local/bin/kubectl

Write-Host "--- Cleanup ---"

Remove-Item $tempFile -Force

Write-Host "--- Verify ---"

$vRaw = kubectl version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "Kubecctl: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install Kubectl ---"
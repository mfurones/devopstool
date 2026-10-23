param(
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install Databricks ---"
# https://docs.databricks.com/en/dev-tools/cli/install.html#curl-installation-for-linux-macos-and-windows

$tempScript = "/tmp/install-databricks.sh"
$url = "https://raw.githubusercontent.com/databricks/setup-cli/main/install.sh"

Write-Host "--- Download script ---"
Invoke-WebRequest -Uri $url -OutFile $tempScript

Write-Host "--- Change permissions ---"
chmod +x $tempScript

Write-Host "--- Run Script ---"
& sh $tempScript

Write-Host "--- Clean up ---"
Remove-Item $tempScript -Force

Write-Host "--- Verify ---"

$vRaw = databricks --version | Out-String
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "Databricks: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install Databricks ---"


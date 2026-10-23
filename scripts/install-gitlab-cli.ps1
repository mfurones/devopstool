param(
    [string]$version,
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install GitLab CLI ---"
# https://docs.gitlab.com/editor_extensions/gitlab_cli/
# https://gitlab.com/gitlab-org/cli/-/releases

$tempFile = "/tmp/glab.deb"

$url = "https://gitlab.com/gitlab-org/cli/-/releases/v$($version)/downloads/glab_$($version)_linux_amd64.deb"

Write-Host "--- Download ---"

curl -fL -o $tempFile $url

Write-Host "--- Install ---"

dpkg -i $tempFile

if ($LASTEXITCODE -ne 0) {
    Write-Host "--- Fixing dependencies ---"
    apt-get install -f -y

    if ($LASTEXITCODE -ne 0) {
        throw "Failed to install GitLab CLI."
    }

    Write-Host "--- Reinstall package ---"
    dpkg -i $tempFile

    if ($LASTEXITCODE -ne 0) {
        throw "Failed to install GitLab CLI after fixing dependencies."
    }
}

Write-Host "--- Cleanup ---"

Remove-Item $tempFile -Force

Write-Host "--- Verify ---"

$vRaw = glab --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "GitLab: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install GitLab CLI ---"
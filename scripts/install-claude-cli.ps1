param(
    [string]$version,
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install Claude CLI ---"

& bash -c "curl -fsSL https://claude.ai/install.sh | bash -s $version"

Write-Host "--- Config Claude CLI ---"
$claudeDir = Join-Path $HOME '.claude'
New-Item -ItemType Directory -Force -Path $claudeDir | Out-Null

$settings = @{
    env = @{
        DISABLE_AUTOUPDATER = '1'
    }
}
$settings | ConvertTo-Json -Depth 10 | Set-Content -Path (Join-Path $claudeDir 'settings.json') -Encoding utf8

Write-Host "--- Claude location ---"
find / -name "claude" 2>$null

Write-Host "--- Create symbolic link ---"
$symbolicPath = "/usr/local/bin/claude"
$symbolicTarget = Join-Path $HOME ".local/bin/claude"

New-Item -ItemType SymbolicLink -Path $symbolicPath -Target $symbolicTarget -Force | Out-Null

Write-Host "--- Verify ---"
& claude --version

Write-Host "--- Verify ---"

$vRaw = claude --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "Claude: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install Claude ---"

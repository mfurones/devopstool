param()

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- APT clean ---"
apt-get autoremove -y
apt-get clean

Remove-Item /var/lib/apt/lists/* -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item /var/cache/apt/* -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "--- Remove APT mock ---"
$prefix = "/usr/local/bin"
@(
    "apt",
    "apt-get",
    "apt-key"
) | ForEach-Object {
    Remove-Item "$prefix/$_" -Force -ErrorAction SilentlyContinue
}

Write-Host "--- Remove APT cache ---"
Remove-Item "/var/lib/apt/lists/*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "/var/cache/apt/*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "--- Remove APT repos ---"
Get-ChildItem "/etc/apt/sources.list.d/" -Filter "*.list" | Remove-Item -Force

Write-Host "--- Journal clean ---"
if (Get-Command journalctl -ErrorAction SilentlyContinue) {
    journalctl --rotate
    journalctl --vacuum-time=1s
}

Write-Host "--- Log clean ---"

# Delete compressed and rotated logs
find /var/log -type f -name "*.gz" -delete
find /var/log -type f -name "*.[0-9]" -delete

# Truncate all remaining log files
find /var/log -type f -exec cp /dev/null {} \;

Write-Host "--- Symlinks clean ---"
Remove-Item "/usr/local/bin/invoke_tests" -Force -ErrorAction SilentlyContinue

Write-Host "--- Python clean ---"
find /usr -type d -name "__pycache__" -exec rm -rf {} \;
find /usr -name "*.pyc" -delete

find /opt -type d -name "__pycache__" -exec rm -rf {} \;
find /opt -name "*.pyc" -delete

# Write-Host "--- Remove PIP cache ---"
# python -m pip cache purge

Write-Host "--- Remove TMP ---"
Remove-Item "/tmp/*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "/var/tmp/*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "--- Remove TMP ---"
Remove-Item "$HOME/.local/share/powershell" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "--- Remove Cache ---"
rm -rf /root/.cache/*

Write-Host "--- End Cleanup ---"

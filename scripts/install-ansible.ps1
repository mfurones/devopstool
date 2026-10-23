param(
    [string]$versionPath = "/home/versions.txt"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "--- Install Ansible ---"
# https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu

Write-Host "--- Install dependencies ---"

apt-get install -y software-properties-common

Write-Host "--- Add Ansible PPA ---"

add-apt-repository --yes --update ppa:ansible/ansible

Write-Host "--- APT update ---"

apt-get update

Write-Host "--- Install Ansible ---"

apt-get install -y ansible

Write-Host "--- Verify ---"

$vRaw = ansible --version
$version = [regex]::Match($vRaw[0], '\b(\d+\.\d+\.\d+)\b')[0].Value
$content = "Ansible: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install Ansible ---"
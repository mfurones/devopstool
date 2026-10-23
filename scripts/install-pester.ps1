param(    
    [string]$versionPath = "/home/versions.txt"
)

Write-Host "--- Install Pester ---"

Set-PSRepository PSGallery -InstallationPolicy Trusted

Install-Module -Name Pester -Scope AllUsers -Force -SkipPublisherCheck

Write-Host "--- Installed modules ---"
Get-Module Pester -ListAvailable | Format-Table Name, Version, Path

Write-Host "--- Verify ---"

Import-Module Pester
$vRaw = Get-Module -Name Pester
$version = $vRaw.Version.ToString()
$content = "Pester: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install Pester ---"


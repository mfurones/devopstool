param(
    [string]$versionPath = "/home/versions.txt"
)

Write-Host "--- Install GIT ---"
# https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

apt-get install -y git-all

Write-Host "--- Add branch name to prompt ---"

$bashrc = "$HOME/.bashrc"

if (-not (Select-String -Path $bashrc -Pattern "git-sh-prompt" -Quiet -ErrorAction SilentlyContinue)) {
    $content = @'
# Git prompt
source /usr/lib/git-core/git-sh-prompt
export PS1='\[\e[32m\]\u@\h\[\e[m\]:\[\e[34m\]\w\[\e[m\]$(__git_ps1 " \[\e[33m\](%s)\[\e[m\]")\$ '
'@
    Add-Content -Path "$HOME/.bashrc" -Value $content
}

Write-Host "--- Verify ---"

$vRaw = git --version
$version = $($vRaw | Select-String -Pattern '\d+\.\d+\.\d+').Matches[0].Value
$content = "Git: $version"
$content | Add-Content -Path $versionPath -Encoding utf8
Write-Host "--- $content ---"

Write-Host "--- End Install GIT ---"


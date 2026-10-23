param()

#region Parameters
$ubuntu_version = "24.04" #https://releases.ubuntu.com/
$ubuntu_name = "noble" #https://releases.ubuntu.com/
$python_version = "3.12" # https://devguide.python.org/versions/
$node_version = "24" # https://nodejs.org/en/about/previous-releases
$az_cli_version = "2.90.0" # https://learn.microsoft.com/en-us/cli/azure/release-notes-azure-cli?view=azure-cli-latest
$terraform_version = "1.16.4-1" # https://github.com/hashicorp/terraform/releases
$gcp_cli_version = "575.0.1" # https://docs.cloud.google.com/sdk/docs/release-notes
$gitlab_cli_version = "1.106.0" # https://gitlab.com/gitlab-org/cli/-/releases
$kubectl_version = "1.34.9" # https://kubernetes.io/releases/
$psql_version = "17" # https://apt.postgresql.org/pub/repos/apt/dists/
$claude_cli_version = "2.1.287" # https://code.claude.com/docs/en/changelog
#endregion Parameters

#region execution
#& "$PSScriptRoot/001-test.ps1" -texto $untexto
& "$PSScriptRoot/install-common.ps1"
& "$PSScriptRoot/install-python.ps1" -version $python_version
& "$PSScriptRoot/install-pip.ps1" -version $python_version
& "$PSScriptRoot/install-pipx.ps1"
& "$PSScriptRoot/install-git.ps1"
& "$PSScriptRoot/install-az-cli.ps1" -version $az_cli_version -osVersion $ubuntu_version -osName $ubuntu_name
# & "$PSScriptRoot/install-gcp-cli.ps1" -version $gcp_cli_version
& "$PSScriptRoot/install-node.ps1" -version $node_version
# & "$PSScriptRoot/install-jfrog-cli.ps1"
& "$PSScriptRoot/install-github-cli.ps1"
# & "$PSScriptRoot/install-gitlab-cli.ps1" -version $gitlab_cli_version
& "$PSScriptRoot/install-databricks-cli.ps1"
& "$PSScriptRoot/install-terraform.ps1" -version $terraform_version
& "$PSScriptRoot/install-ansible.ps1"
# & "$PSScriptRoot/install-kubectl.ps1" -version $kubectl_version
& "$PSScriptRoot/install-psql.ps1" -version $psql_version -osVersion $ubuntu_version -osName $ubuntu_name
& "$PSScriptRoot/install-pester.ps1"
& "$PSScriptRoot/install-claude-cli.ps1" -version $claude_cli_version
## through PIP
& "$PSScriptRoot/install-checkov.ps1"
## through Node
& "$PSScriptRoot/install-clasp.ps1"
#endregion execution

#region post install
& "$PSScriptRoot/cleanup.ps1"
#endregion post install

#region Invoke tests programs

# Write-Host "--- Pester Configuration ---"
# $config = New-PesterConfiguration
# $config.Run.Path = "./100-main.Tests.ps1"
# $config.Output.Verbosity = "Detailed"
# $config.TestResult.Enabled = $true
# $config.TestResult.OutputFormat = "NUnitXml"
# $config.TestResult.OutputPath = "/home/TestResults.xml"

# Write-Host "--- Run Pester ---"
# Invoke-Pester -Configuration $config
#endregion Invoke tests programs

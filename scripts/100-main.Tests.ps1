# Import Pester
Import-Module Pester

# Describe the 'Program Installation Check' test
Describe 'Program Installation Check' {
    Context 'Installed on BASH' {

        It 'Should have Python 3.12 installed' {
            $python = Get-Command python3.12 -ErrorAction SilentlyContinue
            $python | Should -Not -BeNullOrEmpty
        }

        It 'Should have PowerShell installed' {
            $pwsh = Get-Command pwsh -ErrorAction SilentlyContinue
            $pwsh | Should -Not -BeNullOrEmpty
        }

        It 'Should have Git installed' {
            $git = Get-Command git -ErrorAction SilentlyContinue
            $git | Should -Not -BeNullOrEmpty
        }

        It 'Should have Terraform installed' {
            $tf = Get-Command terraform -ErrorAction SilentlyContinue
            $tf | Should -Not -BeNullOrEmpty
        }

        It 'Should have Ansible installed' {
            $ansible = Get-Command ansible -ErrorAction SilentlyContinue
            $ansible | Should -Not -BeNullOrEmpty
        }

        It 'Should have Kubectl installed' {
            $kubectl = Get-Command kubectl -ErrorAction SilentlyContinue
            $kubectl | Should -Not -BeNullOrEmpty
        }

        It 'Should have psql installed' {
            $psql = Get-Command psql -ErrorAction SilentlyContinue
            $psql | Should -Not -BeNullOrEmpty
        }

    }

    Context 'Based on Python Venv' {

        It 'Should have Python installed' {
            Test-Path "/opt/venv/bin/python" | Should -Be $true
        }

        It 'Should have Pip installed' {
            Test-Path "/opt/venv/bin/pip" | Should -Be $true
        }

        It 'Should have Checkov installed' {
            Test-Path "/opt/venv/bin/checkov" | Should -Be $true
        }
    }

    Context 'CLI (Command Line Interface)' {

        It 'Should have Azure CLI installed' {
            $az = Get-Command az -ErrorAction SilentlyContinue
            $az | Should -Not -BeNullOrEmpty
        }

        It 'Should have GCP CLI installed' {
            $gcp = Get-Command gcloud -ErrorAction SilentlyContinue
            $gcp | Should -Not -BeNullOrEmpty
        }

        It 'Should have GitHub CLI installed' {
            $gcp = Get-Command gh -ErrorAction SilentlyContinue
            $gcp | Should -Not -BeNullOrEmpty
        }

        It 'Should have GitLab CLI installed' {
            $gcp = Get-Command glab -ErrorAction SilentlyContinue
            $gcp | Should -Not -BeNullOrEmpty
        }

        It 'Should have Jfrog CLI installed' {
            $jf = Get-Command jf -ErrorAction SilentlyContinue
            $jf | Should -Not -BeNullOrEmpty
        }

        It 'Should have Databricks CLI installed' {
            $gh = Get-Command databricks -ErrorAction SilentlyContinue
            $gh | Should -Not -BeNullOrEmpty
        }

        It 'Should have AWX CLI (Ansible CLI) installed' {
            Test-Path "/opt/venv/bin/awx" | Should -Be $true
        }

    }

    Context 'Azure CLI extensions' {

        It 'Should have Azure DevOps installed' {
            $devops = (az extension list --output json | ConvertFrom-Json) | Where-Object { $_.name -eq "azure-devops" }
            $devops | Should -Not -BeNullOrEmpty
        }
        
    }

    Context 'Terraform Providers' {

        It 'Should have terraform-provider-databricks_v1.62.0 installed' {
            Test-Path "~/.terraform.d/plugins/registry.terraform.io/databricks/databricks/1.62.0/linux_amd64/terraform-provider-databricks_v1.62.0" | Should -Be $true
        }
        
    }

    Context 'Installed on PowerShell' {

        It 'Should have Pester installed' {
            $pester = Get-Module -Name Pester -ListAvailable
            $pester | Should -Not -BeNullOrEmpty
        }

    }

    Context 'Installed on BASH (less relevant)' {
        
        It 'Should have Curl installed' {
            $curl = Get-Command curl -ErrorAction SilentlyContinue
            $curl | Should -Not -BeNullOrEmpty
        }
        
        It 'Should have Wget installed' {
            $wget = Get-Command wget -ErrorAction SilentlyContinue
            $wget | Should -Not -BeNullOrEmpty
        }
        
        It 'Should have unzip installed' {
            $unzip = Get-Command unzip -ErrorAction SilentlyContinue
            $unzip | Should -Not -BeNullOrEmpty
        }
        
        It 'Should have unzip installed' {
            $unzip = Get-Command unzip -ErrorAction SilentlyContinue
            $unzip | Should -Not -BeNullOrEmpty
        }
        
        It 'Should have rsync installed' {
            $rsync = Get-Command rsync -ErrorAction SilentlyContinue
            $rsync | Should -Not -BeNullOrEmpty
        }
        
        It 'Should have gnupg installed' {
            $gnupg = Get-Command gnupg -ErrorAction SilentlyContinue
            $gnupg | Should -Not -BeNullOrEmpty
        }
        
        It 'Should have vim installed' {
            $vim = Get-Command vim -ErrorAction SilentlyContinue
            $vim | Should -Not -BeNullOrEmpty
        }
        
        It 'Should have jq installed' {
            $jq = Get-Command jq -ErrorAction SilentlyContinue
            $jq | Should -Not -BeNullOrEmpty
        }

    }
}
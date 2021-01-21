#requires -version 7
#Because: Kusto-Style Pipelines
Describe 'CSV Vault Demo' {
    BeforeAll {
        $ErrorActionPreference = 'Stop'
        #First Import our Module
        $ModuleRoot = Resolve-Path "$PSScriptRoot/.."
        Import-Module -Force $ModuleRoot

        #Lets "Pause" each time we hit a Secret Management Command
        $SMCommands = (Get-Command -module 'microsoft.powershell.secretmanagement').Name 
            | Where-Object {$_ -notmatch 'register'}
        Set-PSBreakpoint -Command $SMCommands -Action {
            Write-Host -Fore Yellow -Back DarkCyan "PAUSE: $PSItem";break
        }

        #Then register our test vaults. Registration only saves the vault info into the vault metadata file, it doesn't do anything yet!
        Register-SecretVault -Name 'MyTestVault' -ModuleName (Resolve-Path "$ModuleRoot/SecretManagement.CSV.psd1")
        Register-SecretVault -Name 'MyTestVault2' -ModuleName (Resolve-Path "$ModuleRoot/SecretManagement.CSV.psd1") -VaultParameters @{
            Path = "$Home/Desktop/MyTestVault2.csv"
        }
    }
    AfterAll {
        try {
            Unregister-SecretVault -Name 'MyTestVault'
        } catch {}
        try {
            Unregister-SecretVault -Name 'MyTestVault2'
        } catch {}
    }
    It 'Test one vault' {
        Test-SecretVault -Name 'MyTestVault' | Should -Be $True
    }

    It 'Fetch the info of a secret' {
        Get-SecretInfo -Name 'MyTestSecret' -Vault 'MyTestVault'
    }

    It 'Can create secrets and fetch them' {
        Set-Secret -Name 'MyTestSecret' -Vault 'MyTestVault' -Secret 'notverysecret'
    }


}
using namespace Microsoft.Powershell.SecretManagement
function Get-SecretInfo {
    [CmdletBinding()]
    param (
        #Filter that is defined however you want to handle it. Recommend wildcards. 
        #This is passed in from Get-SecretInfo -Name. Note it is named different!
        [string] $Filter,
        #The vault, passed in from Get-SecretInfo -Vault. Note it is named different!
        [string] $VaultName,
        #Passed in from VaultParameters. Note it is named different!
        #WARNING: NOT PASSED IF CALLED FROM ANOTHER FUNCTION hence the default setting here
        [hashtable] $AdditionalParameters = (Get-SecretVault -Name $VaultName).VaultParameters
    )

    #RECOMMENDED TIP: Always check the vault is still active before each command. You can define your own custom function,
    #But I like to use the same function I use to test the vault for consistency and D.R.Y.
    #This is calling the "internal" test-secretvault, which can be confusing
    #WARNING: You shouldn't prefix this with modulename\Test-Secretvault, it will break things.
    #You should also use VaultName instead of Name, unfortunately the inconsistency is very confusing
    Test-SecretVault -VaultName $VaultName -Quick #Note our special custom "quick" parameter

    Write-Host -Fore Yellow 'Getting Secret Info!'

    #You can return multiple secret infos
    return @(,[SecretInformation]::new(
        "Name",        # Name of secret
        "String",      # Secret data type [Microsoft.PowerShell.SecretManagement.SecretType]
        $VaultName))   # Name of vault
}

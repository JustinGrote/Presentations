function Test-SecretVault {
    [CmdletBinding()]
    param (
        #Passed in from Test-SecretVault -Vault. Note the name is different!
        [string] $VaultName,
        #Passed in from VaultParameters. 
        #WARNING: NOT PASSED IF CALLED FROM ANOTHER FUNCTION hence the default setting here
        [hashtable] $AdditionalParameters = (Get-SecretVault -Name $VaultName).VaultParameters,

        #NOTE: You can add more parameters here if you wish, and they will only be seen when calling the commands internally.
        #For example you could add a [Switch]$Quick parameter to do a quick test before every cmdlet that the vault is still there
        [Switch]$Quick
    )

    Write-Host -Fore Magenta 'Testing the vault!'

    if (-not $Quick) {
        Write-Host -Fore Magenta 'No -Quick found, lets do a detailed check!'
    }
    # return [TestStore]::TestVault()
    return $true
}
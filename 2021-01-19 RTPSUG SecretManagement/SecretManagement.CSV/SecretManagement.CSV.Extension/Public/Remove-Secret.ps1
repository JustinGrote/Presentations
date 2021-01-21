function Remove-Secret {
    [CmdletBinding()]
    param (
        #Passed in from Remove-Secret -Name
        [string] $Name,
        #Passed in from Remove-Secret -Vault. Note it is different!
        [string] $VaultName,
        #Passed in from VaultParameters. 
        #WARNING: NOT PASSED IF CALLED FROM ANOTHER FUNCTION hence the default setting here
        [hashtable] $AdditionalParameters = (Get-SecretVault -Name $VaultName).VaultParameters
    )
    Write-Host -Fore Red "Uh Oh, removing secret $Name from $VaultName with Additional Parameters:" + [Environment]::new

    # return [TestStore]::RemoveItem($Name)
    return $false
}
function Set-Secret {
    [CmdletBinding()]
    param (
        #Passed in from Set-Secret -Name
        [string] $Name,
        #Passed in from Set-Secret -Secret or -SecureStringSecret
        #Supported types as of 0.9 are:
            # byte[]
            # string
            # SecureString
            # PSCredential
            # Hashtable
        #So you should error if any other type is provided
        [object] $Secret,
        #Passed in from Set-Secret -Vault. Note the name is different!
        [string] $VaultName,
        #Passed in from VaultParameters. 
        #WARNING: NOT PASSED IF CALLED FROM ANOTHER FUNCTION hence the default setting here
        [hashtable] $AdditionalParameters = (Get-SecretVault -Name $VaultName).VaultParameters
    )
    Write-Host -Fore DarkYellow 'Setting a new secret!'

    # return [TestStore]::SetItem($Name, $Secret)
    return $false
}
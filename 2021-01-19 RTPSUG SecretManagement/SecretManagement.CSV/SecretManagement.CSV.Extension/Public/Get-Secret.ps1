function Get-Secret {
    [CmdletBinding()]
    param (
        #The name of the secret, passed through from Get-Secret -Name
        [string] $Name,
        #The VaultName of the secret, passed through from Get-Secret -Vault. Careful! They aren't the same
        #WARNING: NOT PASSED THROUGH IF SECRETINFO IS PIPED TO GET-SECRET
        [string] $VaultName,
        #Passed in from VaultParameters. 
        #WARNING: NOT PASSED IF CALLED FROM ANOTHER FUNCTION hence the default setting here
        [hashtable] $AdditionalParameters = (Get-SecretVault -Name $VaultName).VaultParameters
    )



    Write-Host -Fore Green 'Getting Secret!'

    #You should return one and only one secret!
    return $null
}
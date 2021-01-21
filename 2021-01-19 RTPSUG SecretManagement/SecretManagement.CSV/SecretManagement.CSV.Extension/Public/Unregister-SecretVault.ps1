function Unregister-SecretVault {
    [CmdletBinding()]
    param (
        [string] $VaultName,
        [hashtable] $AdditionalParameters
    )
    Write-Host -Fore DarkCyan "Aww you unregistered our vault. We will clean it up for you. Sad panda!"

    # Perform optional work to extension vault before it is unregistered
}
#Scaffolded from https://github.com/powershell/secretmanagement README

$PublicFunctions = Get-Item $PSScriptRoot/Public/*.ps1 | Foreach-Object {
    . $PSItem
    $PSItem.BaseName
}
Export-ModuleMember -Function $PublicFunctions
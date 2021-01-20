@{
    ModuleVersion = '1.0'
    RootModule = '.\TestStoreImplementation.dll'
    NestedModules = @('.\TestVault.Extension')
    CmdletsToExport = @('Set-TestStoreConfiguration','Get-TestStoreConfiguration')
    PrivateData = @{
        PSData = @{
            Tags = @('SecretManagement')
        }
    }
}
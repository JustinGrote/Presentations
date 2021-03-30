resource mystorageaccount 'Microsoft.Storage/storageAccounts@2021-01-01' = {
  name: 'mysupercoolstont'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}



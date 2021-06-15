resource webStorage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'storwoodgroveweb'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    
  }
}

resource sqlStorage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'storwoodgrovesql'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    
  }
}

output webStorageId string = webStorage.id
output sqlStorageId string = sqlStorage.id


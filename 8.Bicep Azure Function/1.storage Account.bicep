
param location string
param pSTAName string
param pEnv string


// Create Storage Account

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: pSTAName
  location: location
  kind: 'StorageV2'
  sku: {
    name:   (pEnv == 'dev')? 'Standard_LRS':'Standard_ZRS'
  }
  properties: {
    accessTier: 'Hot'

  }
}


output oSTAid string = storageaccount.id
output oSTAName string = storageaccount.name
// output ostorageAccountKey array = storageaccount.listKeys().keys


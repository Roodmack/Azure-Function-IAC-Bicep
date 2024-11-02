

targetScope = 'resourceGroup'

var  location  = resourceGroup().location 

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  kind: 'linux' // if not specify default value is  'windows'
  name: 'azr-asp-linux-dev'
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
  // Property mandatory for linux deployment, could be remove if kind=windows
  properties: {
     reserved:true
     
  }
}


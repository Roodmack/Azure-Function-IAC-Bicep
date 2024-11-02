

targetScope = 'resourceGroup'

var  location  = resourceGroup().location 
// Create a windows App Service Plan or Serverfarm
resource AppServicePlan 'Microsoft.Web/serverfarms@2023-12-01'={
  name: 'azr-aps-win-dev'
  location: location
  sku: {
    name: 'F1'// 'S1'
    capacity: 1
  }
}
// App Service or Web Application or Sites
resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: 'azr-appservice-win-dev'
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'AppServicePlan'
  }
  properties: {
    serverFarmId: AppServicePlan.id // id of the app service plan
  }
}

// Create App Setting for an Web App, those value will overight any thing from apps settings
resource appserviceappsetting  'Microsoft.Web/sites/config@2023-12-01'={
  name: 'web'
  parent: webApplication

properties: {
  appSettings:  [
    {
      name:'key1'
      value: 'value1'

    
    }
    {
      name: 'key2'
      value: 'value22'
    }
  ]


}

}


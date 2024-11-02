
// Application Insight Deployment : https://youtu.be/8BHS1ddnEPk?list=PLZ1A-UOV76etaV-zD_aSsW0Y1MIW55dve
targetScope = 'resourceGroup'

var  location  = resourceGroup().location 
// Create a windows App Service Plan or Serverfarm
resource AppServicePlan 'Microsoft.Web/serverfarms@2023-12-01'={
  name: 'azr-aps-win-dev'
  location: location
  sku: {
    name:'F1'
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

// Create an Application insight
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'azr-appinsight-dev'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
  dependsOn: [
     webApplication
  ]
}


// Create an Apps Setting and link the App insight with  the web app
resource appsettings 'Microsoft.Web/sites/config@2023-12-01'= {
  name: 'web'
  parent: webApplication
  properties: {
     appSettings: [
      {
        name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: appInsights.properties.InstrumentationKey // get the intrumentation key
      }
     ]
  }

}



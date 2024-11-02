param pAppServicePlanName string
param location string




resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: pAppServicePlanName
  location: location
  sku: {
    name: 'S1'
    capacity: 1
  }

}


output oAppServicePlanid string = appServicePlan.id

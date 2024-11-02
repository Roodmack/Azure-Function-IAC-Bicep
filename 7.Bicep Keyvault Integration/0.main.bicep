
// Param 
param pAppServicePlanName string 
param pAppServiceName string 
  param pSQLServerName string 
param pAppinsigntname string 
param location string =resourceGroup().location
@secure()
param pSQLpasswordAdmin string
param pSqlAccountAdmin string
param pAppsvcKeyvault string
param pEnv string
param pdeploySQL bool // Main param to control sql deployment
// param pResourceGroupName string 




// get keyvault
//https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/key-vault-parameter?tabs=azure-cli

resource keyvault 'Microsoft.KeyVault/vaults@2024-04-01-preview' existing = {
  name:'AZR-Keyvault-01'
  scope:resourceGroup('AzurVault_PayAsYouGo') // use this param if the keyvault is not on the same resource group
}


// Create App Service Plan or ServerFarm and App Service or Web App,

module mAppServicePlan '1.Appserviceplan.bicep'= {
  name: 'appServicePlan'
  params: {
    location: location
    pAppServiceName: pAppServiceName
    pAppServicePlanName: pAppServicePlanName
    pIntrumentationKey: mAppInsight.outputs.oIntrumentationKey
    pAppsvcKeyvault: keyvault.getSecret('azr-microsoft365-data-api')//pAppsvcKeyvault // to be remove
    //this param is to control web application slot deployment base on env
    pEnv: pEnv
  }
}


// Create  SQL Data Base
module mSQLDatabase '2.sqlserver.bicep'= if(pdeploySQL) {
  name: 'SQLDatabase'
  params: {
    location: location
    pSQLServerName: pSQLServerName
    pSQLpasswordAdmin:pSQLpasswordAdmin
    pSqlAccountAdmin:pSqlAccountAdmin
  }
}

// Create App Insight
module mAppInsight '4.AppInsight.bicep'= {
  name: 'AppInsignt'
  params: {
    location: location
    pAppinsigntname: pAppinsigntname

  }
}

output sqlAdminAccountkevault string =pSqlAccountAdmin
output sqlAdminAccount1 string =pAppsvcKeyvault
output sqlAdminAccount2 string =pSQLpasswordAdmin
output penv string =pEnv
// output SQLStringsecret  string =pSQLpasswordAdmin


// Storage Account Param
param pSTAName string
param pEnv string
param location string = resourceGroup().location
// App Service Plan Param 
param pAppServicePlanName string
//App Insight Param
param pAppInsightsName string
// Azure function Param
param pAzureFunctionName string
//Param KeyVault
param pkeyVaultName string
param pGroupAdminId string
@secure()
param pSecretValue1 string

//Param Role Assinment
param pGroupID string



// Create Storage Account with Blob Service and Table Service
module mstorageaccount  '1.storage Account.bicep' = {
  name: 'mstorageaccount'
  params: {
    location: location
    pEnv: pEnv
    pSTAName: pSTAName
  }
}

// Create App Service Plan
module mAppServicePlan '2.AppServicePlan.bicep'= {
  name: 'AppServicePlan'
  params: {
    location: location
    pAppServicePlanName: pAppServicePlanName
  }
}

// create App Insight
module mAppInsights '3.ApplicationInsight.bicep' = {
  name: 'AppInsights'
  params: {
    location: location
    pAppInsightsName: pAppInsightsName
  }

}

module mAzureFunction '4.functionApp.bicep'= {
  name: pAzureFunctionName
  params: {
    location: location
    pAppInsightsKey: mAppInsights.outputs.appInsightsKey
    pAppServicePlanID: mAppServicePlan.outputs.oAppServicePlanid
    pAzureFunctionName: pAzureFunctionName
    pstorageaccountID:mstorageaccount.outputs.oSTAid
    pstorageaccountName:mstorageaccount.outputs.oSTAName

  }

  // dependsOn:[
  //   mAppInsights
  //   mAppServicePlan
  //   mstorageaccount
  // ]
}


// Create Keyvault 
module mKeyvault '6.KeyVault.bicep' = {
  name: pkeyVaultName
  params: {
    location: location
    pGroupAdminId: pGroupAdminId
    pSecretValue1: pSecretValue1
    pkeyVaultName: pkeyVaultName

  }

  dependsOn:[
    mAzureFunction
  ]
}


// Assign Contributor Role to sec group to  current resource group
module mResourcegroupRBCRole '7.AssignedRBAC_Role.bicep'= {
  name: 'RoleAssignementforSecurityGroup'
  scope:resourceGroup()
  params: {
    pGroupID: pGroupID
  }
  dependsOn:[
    mAzureFunction
  ]
}




output keyvaultid string = mKeyvault.outputs.okeyvaultId






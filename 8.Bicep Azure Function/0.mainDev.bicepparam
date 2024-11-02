using './0.main.bicep'


param pEnv = 'dev'
// sprage Account
param pSTAName = 'azrstadeploybicepdev'
//app sv plan
param pAppServicePlanName = 'azraspdeploybicepdev'
// app insight
param pAppInsightsName = 'azraideploybicepdev'
// az function
param pAzureFunctionName = 'azrfuncdeploybicepdev'
// Keyvault
param pkeyVaultName = 'azrkvdeploybicepdev'
param pGroupAdminId = '7a02eb34-2f75-4f43-bd5d-db0913d8dcdf' //Power Apps Admin Paris
@secure()
param pSecretValue1 = getSecret('aef3cca3-9788-4576-aa6a-a95168443808','AzurVault_PayAsYouGo', 'AZR-Keyvault-01','MyMaindemoSecret')
// Role Assignement rg group
param pGroupID = '7a02eb34-2f75-4f43-bd5d-db0913d8dcdf' //Power Apps Admin Paris













using './0.main.bicep'


param pEnv = 'Prod'
// Storage Account
param pSTAName = 'azrstadeploybicepprod'
// app Service Plan
param pAppServicePlanName = 'azraspdeploybicepprod'
// app insight
param pAppInsightsName = 'azraideploybicepprod'
// az function
param pAzureFunctionName = 'azrfuncdeploybicepprod'
// Keyvault
param pkeyVaultName = 'azrkvdeploybicepprod'
param pGroupAdminId = '47c16676-2e9d-4a46-8dde-763cded7f1a9'
@secure()
param pSecretValue1 = getSecret('aef3cca3-9788-4576-aa6a-a95168443808','AzurVault_PayAsYouGo','MyMaindemoSecret', 'latest')
// Role Assignement rg group
param pGroupID = '7a02eb34-2f75-4f43-bd5d-db0913d8dcdf' //Power Apps Admin Paris












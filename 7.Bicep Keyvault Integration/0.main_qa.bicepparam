
// Parameter bicep

using './0.main.bicep'

param pAppServicePlanName = 'azr-aps-win-qa'
param pAppServiceName = 'azr-appservice-win-qa'
 param pSQLServerName = 'azr-sql-iac-qa'
param pAppinsigntname = 'azr-appinsight-qa'
param pEnv ='qa'
param pdeploySQL = false // Main param to control sql deployment

// param location = resourceGroup().id
// Get secret : https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/key-vault-parameter?tabs=azure-cli
@secure()
param pSQLpasswordAdmin =az.getSecret('aef3cca3-9788-4576-aa6a-a95168443808','AzurVault_PayAsYouGo','AZR-Keyvault-01','sqlAdminPassword','1fee6cd0d597481fa5a33c65dc18bc98')

param pSqlAccountAdmin = az.getSecret('aef3cca3-9788-4576-aa6a-a95168443808','AzurVault_PayAsYouGo','AZR-Keyvault-01','sqlAdminAccount','d0e5c875f15b4562984583f7d775ec20')
// param location = resourceGroup().id
param pAppsvcKeyvault = az.getSecret('aef3cca3-9788-4576-aa6a-a95168443808','AzurVault_PayAsYouGo','AZR-Keyvault-01','sqlAdminAccount')



param pAzureFunctionName string
param location string
param pAppServicePlanID string
// param pstorageAccountKey array // list of storage account key
param pAppInsightsKey string
param pstorageaccountName string
param pstorageaccountID string


resource azureFunction 'Microsoft.Web/sites@2020-12-01' = {
  name: pAzureFunctionName
  location: location
  kind:   'functionapp'
  identity: {
    type:'SystemAssigned'

  }

  tags: {
     func: 'Func Bicep'
  }
  properties: {
    serverFarmId: pAppServicePlanID
    siteConfig: {
      appSettings: [
        {
          name: 'AzureWebJobsDashboard'   
          value: 'DefaultEndpointsProtocol=https;AccountName=${pstorageaccountName};AccountKey=${listKeys(pstorageaccountID, '2021-09-01').keys[0].value}'
        }
        {
          name: 'AzureWebJobsStorage' 
          value: 'DefaultEndpointsProtocol=https;AccountName=${pstorageaccountName};AccountKey=${listKeys(pstorageaccountID, '2021-09-01').keys[0].value}'
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
          value: 'DefaultEndpointsProtocol=https;AccountName=${pstorageaccountName};AccountKey=${listKeys(pstorageaccountID, '2021-09-01' ).keys[0].value}' // '2019-06-01'
        }
        {
          name: 'WEBSITE_CONTENTSHARE'
          value: toLower(pAzureFunctionName)
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: pAppInsightsKey//reference(pAppInsightsID, '2015-05-01').InstrumentationKey
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'powershell'

        }

      ]

    }
  }
}


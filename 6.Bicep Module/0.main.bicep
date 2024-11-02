
// Param 
param pAppServicePlanName string 
param pAppServiceName string 
param pSQLServerName string 
param pAppinsigntname string 
param location string =resourceGroup().location
// param pResourceGroupName string 




// Create App Service Plan or ServerFarm and App Service or Web App
module mAppServicePlan '1.Appserviceplan.bicep'= {
  name: 'appServicePlan'
  params: {
    location: location
    pAppServiceName: pAppServiceName
    pAppServicePlanName: pAppServicePlanName
    pIntrumentationKey: mAppInsight.outputs.oIntrumentationKey
  }
}


// Create  SQL Data Base
module mSQLDatabase '2.sqlserver.bicep'= {
  name: 'SQLDatabase'
  params: {
    location: location
    pSQLServerName: pSQLServerName
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

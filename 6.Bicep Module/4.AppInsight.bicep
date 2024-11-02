
param pAppinsigntname string 

param location string 
// Create an Application insight
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: pAppinsigntname
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }

}


output oIntrumentationKey string=appInsights.properties.InstrumentationKey

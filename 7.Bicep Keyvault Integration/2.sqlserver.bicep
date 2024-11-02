
// Create a SQL DataBase
param pSQLServerName string 
@secure()
param pSQLpasswordAdmin string

param pSqlAccountAdmin string




param location string 


// Create Sever
resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: pSQLServerName
  location: location
   properties: {
    administratorLogin: pSqlAccountAdmin//'roodmack'
    administratorLoginPassword : pSQLpasswordAdmin //'PLRooimack789**'
   }

}



// Witelisting IP Address for the SQL  Servver , this is not overwrite the existing one
resource sqlServerFirewallRules 'Microsoft.Sql/servers/firewallRules@2021-02-01-preview' = {
  parent: sqlServer
  name: 'mypc ip Address'
  properties: {
    startIpAddress: '1.1.1.1'
    endIpAddress: '1.1.1.1'
  }
}

// Create SQL Database
// resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2021-11-01'={ 
//   parent: sqlServer
//   name: 'db1'
//   location: location
//   properties: {
//     collation: 'SQL_Latin1_General_CP1_CI_AS'
//     maxSizeBytes: 2147483648 // Example value: 2 GB
//     //sampleName: 'AdventureWorksLT'
//   }

// }

// Create SQL Database
resource sqlServerDatabase2 'Microsoft.Sql/servers/databases@2021-11-01'={ 
  parent: sqlServer
  name: 'db2'
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648 // Example value: 2 GB
    //sampleName: 'AdventureWorksLT'
  }

}


param location string
param pkeyVaultName string
param pGroupAdminId string
@secure()
param pSecretValue1 string



resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01'={
  name: pkeyVaultName
  location: location
  properties: {
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    tenantId: subscription().tenantId
    enableRbacAuthorization:true
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: pGroupAdminId //Group :  Admin App Maker
        permissions: {
          keys: [
            'get'
          ]
          secrets: [
            'list'
            'get'
            'set'
          ]
        }
      }
    ]
    sku: {
      name: 'standard'
      family: 'A'
    }
  }
  resource keyVaultSecret1 'secrets@2023-07-01'  = {
    name: 'keyVaultSecret1'
    properties: {
      attributes: {
        enabled: true
      }
      contentType: 'Secret'
      value:pSecretValue1
    }
 

  }
  resource keyVaultSecret2 'secrets@2023-07-01'  = {
    name: 'keyVaultSecret2'
    properties: {
      attributes: {
        enabled: true
      }
      contentType: 'Secret'
      value:'Belot_Haiti_2056'
    }

}
}


// Create Role Aassignement for Keyvault
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-10-01-preview' = {
  name: guid(subscription().id,resourceGroup().id,resourceGroup().name)
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'b86a8fe4-44ce-4948-aee5-eccb2c155cd7') //'b86a8fe4-44ce-4948-aee5-eccb2c155cd7'  
    principalId: pGroupAdminId
    principalType: 'Group'
    description: 'Assign Keyvault Officer Role to Security Group'
  }

}


//Microsoft.Authorization/roleDefinitions/b86a8fe4-44ce-4948-aee5-eccb2c155cd7


output okeyvaultId string = keyVault.id

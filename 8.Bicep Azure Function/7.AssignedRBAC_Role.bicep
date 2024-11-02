param pGroupID string

// Create Role Assingment for Resource Group
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-10-01-preview' = {
  name: guid(resourceGroup().id,subscription().id,deployment().name)
  // scope:  resourceGroup()
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'b24988ac-6180-42a0-ab88-20f7382dd24c') // Contributor role on AD group
    principalId: pGroupID
    principalType: 'Group'
    description: 'Assign Contributor ROle to RG Group'
  }
}

targetScope = 'subscription'

resource azr_rs_group 'Microsoft.Resources/resourceGroups@2023-07-01'= {
  name: 'azr_rs_group'
  location: 'East US'
}

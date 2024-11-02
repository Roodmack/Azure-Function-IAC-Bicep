targetScope = 'subscription'


// This will Creaate 3 Resource Groupe
param pResourceGroupName string
var vEnv=['dev','qa','prod']

resource azr_rs_group 'Microsoft.Resources/resourceGroups@2023-07-01'= [for i in vEnv :{
  name: '${pResourceGroupName}-${i}'
  location: 'East US'
  


}

]




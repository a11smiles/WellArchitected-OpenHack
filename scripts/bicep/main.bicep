module network './network.bicep' = {
  name: 'network'
  scope: resourceGroup('rg-eastus-contoso-webapp')
}

module vms './vms.bicep' = {
  name: 'vms'
  scope: resourceGroup('rg-eastus-contoso-webapp')
  params: {
    vnetSubnetId: network.outputs.vnetSubnetId
  }
}

/*
module webapp './webapp.bicep' = {
  name: 'webapp'
  scope: resourceGroup('rg-eastus-contoso-webapp')
}
*/

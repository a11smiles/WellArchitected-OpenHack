resource vnet 'Microsoft.Network/virtualNetworks@2020-05-01' = {
  name: 'vnet-eastus-consoto'
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.0.0/21'
      ]
    }
    subnets: [ 
      {
        name: 'web'
        properties: {
          addressPrefix: '10.10.0.0/24'
        }
      }

    ]
  }
}

output vnetSubnetId string = vnet.id

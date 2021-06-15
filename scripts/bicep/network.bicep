param vnetName string
param nsgName string
param web1vmDnslabel string
param web2vmDnslabel string
param worker1vmDnslabel string
param sqlsvr1vmDnslabel string
param trafficManagerDnsLabel string

resource vnet 'Microsoft.Network/virtualNetworks@2020-05-01' = {
  name: vnetName
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.0.0/16'
      ]
    }
    subnets: [ 
      {
        name: 'dmz'
        properties: {
          addressPrefix: '10.10.0.0/28'
        }
      }
      {
        name: 'jobs'
        properties: {
          addressPrefix: '10.10.0.16/28'
        }
      }
      {
        name: 'sql'
        properties: {
          addressPrefix: '10.10.0.32/27'
        }
      }
    ]
  }
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2020-11-01' = {
  name: nsgName
  location: 'eastus'
  properties: {
    securityRules: [
      {
        name: 'AllowAll'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
    ]
  }
}

resource web1vmPIP 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: 'web1ip'
  location: 'eastus'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    publicIPAddressVersion: 'IPv4'   
    dnsSettings: {
      domainNameLabel: web1vmDnslabel
    }    
  }
}

resource web2vmPIP 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: 'web2ip'
  location: 'eastus'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    publicIPAddressVersion: 'IPv4'  
    dnsSettings: {
      domainNameLabel: web2vmDnslabel
    }     
  }
}

resource worker1vmPIP 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: 'worker1ip'
  location: 'eastus'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    publicIPAddressVersion: 'IPv4'
    dnsSettings: {
      domainNameLabel: worker1vmDnslabel
    }  
  }
}

resource sqlsvr1vmPIP 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: 'sqlsvr1ip'
  location: 'eastus'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    publicIPAddressVersion: 'IPv4'
    dnsSettings: {
      domainNameLabel: sqlsvr1vmDnslabel
    }  
  }
}

resource tmwebapp 'Microsoft.Network/trafficmanagerprofiles@2018-08-01' = {
  name: trafficManagerDnsLabel
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Weighted'
    dnsConfig: {
      relativeName: trafficManagerDnsLabel
      ttl: 60
    }
    monitorConfig: {
      protocol: 'HTTP'
      port: 80
      path: '/'
      intervalInSeconds: 30
      toleratedNumberOfFailures: 3
      timeoutInSeconds: 10
    }
    endpoints: [
      {
        name: 'web1'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          endpointStatus: 'Enabled'
          weight: 50
          targetResourceId: web1vmPIP.id
          target: web1vmPIP.properties.dnsSettings.fqdn
          priority: 1
          endpointLocation: 'East US'
        }
      }
      {
        name: 'web2'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          endpointStatus: 'Enabled'
          weight: 50
          targetResourceId: web2vmPIP.id
          target: web2vmPIP.properties.dnsSettings.fqdn
          priority: 2
          endpointLocation: 'East US'
        }
      }
    ]
    trafficViewEnrollmentStatus: 'Disabled'
    maxReturn: 0
  }
}

output vnetSubnetId string = vnet.id
output nsgId string = nsg.id
output web1vmPIPid string = web1vmPIP.id
output web2vmPIPid string = web2vmPIP.id
output worker1vmPIPid string = worker1vmPIP.id
output sqlsvr1vmPIPid string = sqlsvr1vmPIP.id

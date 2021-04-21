param vnetSubnetId string

resource web1vmDataDisk 'Microsoft.Compute/disks@2020-12-01' = {
  name: 'vhd-eastus-contoso-web1'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    diskSizeGB: 32
    creationData: {
      createOption:'Empty'
    }
  }
}

resource web1vmNic 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: 'nic-eastus-contoso-web1'
  location: 'eastus'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: '${vnetSubnetId}/subnets/web'
          }
          privateIPAddress: '10.10.0.2'
        }
      }
    ]
  }
}
resource web1vm 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: 'vm-eastus-contoso-web1'
  location: 'eastus'
  properties: {
    osProfile: {
      computerName: 'vm-eastus-contoso-web1'
      adminUsername: 'localadmin'
      adminPassword: 'Pass@word1234!'
      windowsConfiguration: {
        provisionVMAgent: true
      }
    }
    hardwareProfile: {
      vmSize: 'Standard_F8s_v2'
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2019-Datacenter'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
      dataDisks: [
        {
          name: 'vhd-eastus-contoso-web1'
          createOption: 'Attach'
          caching: 'ReadOnly'
          lun: 0
          managedDisk: {
            id: web1vmDataDisk.id
          }
        }
      ]
    }
    networkProfile: {
      networkInterfaces: [
        {
          properties: {
            primary: true
          }
          id: web1vmNic.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: false
      }
    }
  }
}

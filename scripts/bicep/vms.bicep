param region string
param web1vmNicId string
param web2vmNicId string 
param worker1vmNicId string 
param sqlsvr1vmNicId string 
param adminUsername string
@secure()
param adminPassword string
param sqlAdminUsername string
@secure()
param sqlAdminPassword string

resource web1vm 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: 'web1'
  location: region
  properties: {
    osProfile: {
      computerName: 'web1'
      adminUsername: adminUsername
      adminPassword: adminPassword
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
      dataDisks: []
    }
    networkProfile: {
      networkInterfaces: [
        {
          properties: {
            primary: true
          }
          id: web1vmNicId
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

resource web1vmIIS 'Microsoft.Compute/virtualMachines/extensions@2020-12-01' = {
  name: 'web1/InstallWebServer'
  location: region
  dependsOn: [
    web1vm
  ]
  properties: {
    publisher: 'Microsoft.Compute'
    type: 'CustomScriptExtension'
    typeHandlerVersion: '1.7'
    autoUpgradeMinorVersion: true
    settings: {
      commandToExecute: 'powershell.exe Install-WindowsFeature -name Web-Server -IncludeManagementTools && powershell.exe remove-item \'C:\\inetpub\\wwwroot\\iisstart.htm\' && powershell.exe Add-Content -Path \'C:\\inetpub\\wwwroot\\iisstart.htm\' -Value $(\'Hello World from \' + $env:computername)'
    }
  }
}

resource web2vm 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: 'web2'
  location: region
  properties: {
    osProfile: {
      computerName: 'web2'
      adminUsername: adminUsername
      adminPassword: adminPassword
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
      dataDisks: []
    }
    networkProfile: {
      networkInterfaces: [
        {
          properties: {
            primary: true
          }
          id: web2vmNicId
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

resource web2vmIIS 'Microsoft.Compute/virtualMachines/extensions@2020-12-01' = {
  name: 'web2/InstallWebServer'
  location: region
  dependsOn: [
    web2vm
  ]
  properties: {
    publisher: 'Microsoft.Compute'
    type: 'CustomScriptExtension'
    typeHandlerVersion: '1.7'
    autoUpgradeMinorVersion: true
    settings: {
      commandToExecute: 'powershell.exe Install-WindowsFeature -name Web-Server -IncludeManagementTools && powershell.exe remove-item \'C:\\inetpub\\wwwroot\\iisstart.htm\' && powershell.exe Add-Content -Path \'C:\\inetpub\\wwwroot\\iisstart.htm\' -Value $(\'Hello World from \' + $env:computername)'
    }
  }
}

resource worker1vm 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: 'worker1'
  location: region
  properties: {
    osProfile: {
      computerName: 'worker1'
      adminUsername: adminUsername
      adminPassword: adminPassword
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
      dataDisks: []
    }
    networkProfile: {
      networkInterfaces: [
        {
          properties: {
            primary: true
          }
          id: worker1vmNicId
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

 resource sqlsvr1vmDataDisk0 'Microsoft.Compute/disks@2020-12-01' = {
  name: 'sqlsvr1_DataDisk_0'
  location: region
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    diskSizeGB: 1024
    creationData: {
      createOption:'Empty'
    }
  }
}

resource sqlsvr1vmDataDisk1 'Microsoft.Compute/disks@2020-12-01' = {
  name: 'sqlsvr1_DataDisk_1'
  location: region
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    diskSizeGB: 1024
    creationData: {
      createOption:'Empty'
    }
  }
}

resource sqlsvr1vm 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: 'sqlsvr1'
  location: region
  properties: {
    osProfile: {
      computerName: 'sqlsvr1'
      adminUsername: adminUsername
      adminPassword: adminPassword
      windowsConfiguration: {
        provisionVMAgent: true
        enableAutomaticUpdates: false
        patchSettings: {
          patchMode: 'Manual'
          enableHotpatching: false
        }
      }
      allowExtensionOperations: true
    }
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    storageProfile: {
      imageReference: {
        publisher: 'microsoftsqlserver'
        offer: 'sql2014sp3-ws2012r2'
        sku: 'web'
        version: 'latest'
      }
      osDisk: {
        osType: 'Windows'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
        }
        diskSizeGB: 127
      }
      dataDisks: [
        {
          name: 'sqlsvr1_DataDisk_0'
          createOption: 'Attach'
          caching: 'ReadOnly'
          lun: 0
          writeAcceleratorEnabled: false
          managedDisk: {
            id: sqlsvr1vmDataDisk0.id
          }
        }
        {
          name: 'sqlsvr1_DataDisk_1'
          createOption: 'Attach'
          caching: 'None'
          lun: 1
          writeAcceleratorEnabled: false
          managedDisk: {
            id: sqlsvr1vmDataDisk1.id
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
          id: sqlsvr1vmNicId
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

resource sqlsvr1sql 'Microsoft.SqlVirtualMachine/sqlVirtualMachines@2017-03-01-preview' = {
  name: 'sqlsvr1'
  location: region
  dependsOn: [
    sqlsvr1vm
  ]
  properties: {
    virtualMachineResourceId: sqlsvr1vm.id
    sqlManagement: 'Full'
    sqlServerLicenseType: 'PAYG'
    autoPatchingSettings: {
      enable: true
      dayOfWeek: 'Sunday'
      maintenanceWindowStartingHour: 15
      maintenanceWindowDuration: 120
    }
    keyVaultCredentialSettings: {
      enable: false
      credentialName: ''
    }
    storageConfigurationSettings: {
      diskConfigurationType: 'NEW'
      storageWorkloadType: 'OLTP'
      sqlDataSettings: {
        luns: [
          0
        ]
        defaultFilePath: 'f:\\Data'
      }
      sqlLogSettings: {
        luns: [
          1
        ]
        defaultFilePath: 'g:\\Logs'
      }
      sqlTempDbSettings: {
        defaultFilePath: 'd:\\TempDb'
      }
    }
    serverConfigurationsManagementSettings: {
      sqlConnectivityUpdateSettings: {
        connectivityType: 'PUBLIC'
        port: 1433
        sqlAuthUpdatePassword: sqlAdminPassword
        sqlAuthUpdateUserName: sqlAdminUsername
      }
      additionalFeaturesServerConfigurations: {
        isRServicesEnabled: false
      }
    }
  }
}

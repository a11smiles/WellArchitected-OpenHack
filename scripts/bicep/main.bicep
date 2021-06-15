param resource_group_name string
param region string
param region_long string
param vnet_name string
param nsg_name string
param storage_web string
param storage_sql string
param web1vm_dnslabel string
param web2vm_dnslabel string
param worker1vm_dnslabel string
param sqlsvr1vm_dnslabel string
param traffic_manager_dnslabel string
param admin_username string
@secure()
param admin_password string
param sql_admin_username string
@secure()
param sql_admin_password string

module network './network.bicep' = {
  name: 'network'
  scope: resourceGroup(resource_group_name)
  params: {
    region: region
    regionLong: region_long
    vnetName: vnet_name
    nsgName: nsg_name
    web1vmDnslabel: web1vm_dnslabel
    web2vmDnslabel: web2vm_dnslabel
    worker1vmDnslabel: worker1vm_dnslabel
    sqlsvr1vmDnslabel: sqlsvr1vm_dnslabel
    trafficManagerDnsLabel: traffic_manager_dnslabel
  }
}

module storage './storage.bicep' = {
  name: 'storage'
  scope: resourceGroup(resource_group_name)
  params: {
    region: region
    storageWeb: storage_web
    storageSql: storage_sql
  }
}

module vms './vms.bicep' = {
  name: 'vms'
  scope: resourceGroup(resource_group_name)
  params: {
    region: region
    vnetSubnetId: network.outputs.vnetSubnetId
    nsgId: network.outputs.nsgId
    web1vmPIPid: network.outputs.web1vmPIPid
    web2vmPIPid: network.outputs.web2vmPIPid
    worker1vmPIPid: network.outputs.worker1vmPIPid
    sqlsvr1vmPIPid: network.outputs.sqlsvr1vmPIPid
    adminUsername: admin_username
    adminPassword: admin_password
    sqlAdminUsername: sql_admin_username
    sqlAdminPassword: sql_admin_password
  }
}

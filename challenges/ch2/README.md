# Operationalize automated deployments

Time Length: **3-4 hours**

## Reminders

* Use an InPrivate/Incognito window in your browser to avoid any confusion with any other credentials that you may use to access Azure resources.
* The credentials you need to access the Azure subscription assigned to your team are available on the _OpenHack Environment_ tab.

## Challenge

As stated previously, Woodgrove Bank started with humble beginnings as a small, community bank. Over the past few decades, Woodgrove Bank has grown to service multiple regions, and Woodgrove Bank expects to expand internationally in the next few years.

When Woodgrove Bank was smaller, it was very easy to deploy virtual machines to meet business requirements. However, as the company continues to expand, managing on-premises resources has increased in complication. Woodgrove Bank's IT team is very concerned with expansion into the cloud and what it will require in terms of additional overhead. Woodgrove Bank would like to somehow automate its cloud environment, if possible. It is seeking Microsoft's help in configuring automated deployments of their cloud environment.

In this challenge, you will configure build and release pipelines in Woodgrove Bank's Azure DevOps tenant to automatically build the current application environment. Luckily, Woodgrove Bank's IT team was able to develop Azure Bicep scripts to construct the underlying Azure infrastructure, however, they do not know how to use Azure DevOps. Therefore, you will leverage the Woodgrove Bank's current Azure Bicep scripts for creating the necessary ARM template(s) to deploy the infrastructure. Additionally, you must redeploy the application components to the Azure virtual machines, as necessary.

It is absolutely imperative you remember that Woodgrove Bank's current workload in Azure is _production_. So anything you do **must** be _non-destructive_. If the site is down for more than 10 minutes, you will fail to meet Woodgrove Bank's RTO.  Woodgrove Bank is depending on Microsoft to maintain the site's availability during this Azure DevOps implementation.

As you plan this challenge, you may want to consider the following questions:

* What will be your strategy for configuring deployments? What conditions must be met? What types of deployments should you consider?
* What type of permissions should be configured for the pipelines?
* What deployment models should you consider to ensure uptime during application recycling?
* How will you rollback failed deployments?

> **NOTE:** For all future challenges, you will be **required** to use automation and the build/release pipelines you configure in this challenge. Therefore, make sure you plan and build wisely. You may find it helpful to know how the included Azure Bicep scripts are constructed so that you are able to correctly refactor them for your needs in future challenges, if desired.
>
> **NOTE:** Automation can be performed via Azure Bicep, Terraform, standard ARM templates, direct REST services, or any other method as long as infrastructure changes are implemented through code (IaC). However, for time sake, it may be faster to use the provided Azure Bicep scripts.

## Customer requirements

Using automated deployments for building their infrastructure (IaaS) creates a great deal of anxiety for Woodgrove Bank. The IT and security teams want to ensure that all of the following concerns are met:

* The IT team wants all resources in the bank's Azure tenant to be deployed via automation. No resources in the Azure tenant should be created manually. This will allow them to deploy the same infrastructure to multiple subscriptions or regions. Additionally, the team wants a repeatable, testable process.
* The IT team wants the ability to view what changes will be made to the Azure environment(s) before the changes are actually implemented.
* The IT team requires that, instead of the entire environment being redeployed on every "release," only necessary changes are deployed.
* The security team is very concerned about the unprivileged access to resources in a public cloud. They are requiring that only the IT team can deploy resources into the Azure tenant.
* Woodgrove Bank's finance team is concerned that unmonitored resources may be introduced into the subscription that will incur unnecessary costs. The team wants to ensure only approved resources (and sizes) are allowed in the subscription. This must be built into the Azure Bicep scripts.
* The finance team must always be able to analyze costs based on department. All resources should be tagged appropriately.
* The development teams want to have the ability to introduce changes to the production workload to users incrementally. This ability does not need to be implemented in _this_ challenge, but it is, nonetheless, a requirement of the development teams and will need to be implemented in future challenges.
* The business requires that any changes will _not_ affect the availability of the application.

## Cheat sheet

### Azure DevOps Repositories

* All repositories use the same naming convention for their build scripts. In the root folder of each repository, you will find its respective `azure-pipelines.yml` script.
* Azure DevOps has the following two projects:
    * _Bicep_: the Azure Bicep files to build the infrastructure
    * _Portal_: the customer portal web application
* The _Bicep_ project has a single repository (e.g. _bicep_)
* Under the _Portal_ project, you will find two repositories:
    * _web_: the source code for the web application
    * _processor_: the source code for the transactions processor timer job

### Azure DevOps Build Artifacts

All included build scripts (i.e. `azure-pipelines.yml`) successfully produce their own artifacts, this includes compiling and unit testing, if applicable. The artifacts are located in the `drop` folder of the pipeline. Additionally, the pipelines for the application components (e.g., UI, API, processor) will produce unit testing coverage reports.

The `drop` artifacts are as follows:

* _bicep_
    * `deploymentParameters.json` - a set a parameters required to deploy the generated ARM template
    * `main.json` - the ARM template generated by Azure Bicep
* _processor_:
    * `Processor.zip` - a dotnet core self-contained executable of the background processor application
* _web_:
    * `Portal.Api.zip` - the dotnet core self-contained WebApi library for the website's backend
    * `Portal.Web.zip` - the dotnet core MVC application for the website's front end

### Azure DevOps Deployment Agents

When instantiating VMs that will host applications deployed from Azure DevOps build/release pipelines, you will need to deploy release agents on them. There are a few ways to automate this (e.g. imaging, DSC, PowerShell Remoting, etc.), but, unfortunately, none of them are very simple and all are time-consuming as there can be a lot of variation.

The simplest way is, once a new VM is instantiated, a DevOps engineer can RDP and deploy the agent manually. This process gives the DevOps engineer the best chance for success and greatest configurability. Because IaC, if done correctly, should only deploy a VM once, the engineer should only be required to deploy and configure the agent once.

A better, middle-ground approach is using Bicep/ARM templates with desired state configuration (DSC) to deploy the _Azure Pipelines Agent_. By using DSC, the DevOps and systems engineers are able to work together in an IaC approach to provisioning target VMs. However, DSC is outside of scope for this OpenHack and, therefore, **RDP'ing into the deployed VMs for installation of the deployment agent is permissable**. The _References_ section below provides some additional help, if needed.

## Success criteria

To succeed in this challenge, you must have the following implemented under the conditions specified in the customer requirements.

* All deployments must be non-destructive. Only environment components not in the current configuration should be destroyed.
* Build and release pipelines must be built in Azure DevOps to automatically:
    * Build and deploy the infrastructure to Woodgrove Bank's Azure subscription
    * Build and deploy the web application on both web virtual machines
    * Build and deploy the background timer job on the worker virtual machine
* Release pipelines must contain gates in order to deploy to the production environments.
* The infrastructure release pipeline must contain a step for displaying the potential changes in the environment _before_ the changes are applied. This step much come before the actual deployment step to allow the IT team to view the effects of the deployment prior to it being executed.
* Create and demonstrate restrictions for specific SKUs in Azure Bicep scripts to limit which SKUs are allowed to be used for deploying resources.
* Plan a strategy for future deployments&mdash;whether in this current environment configuration or a planned, future environment configuration from _Challenge 1_&mdash;that will allow Woodgrove Bank to conduct deployments _without_ requiring any downtime. Discuss this strategy with your coach.

## Success tips

* There are yaml-based build scripts included with each of the three repos. They currently build the assets and place them in a drop folder. The goal of this challenge is not crafting original build scripts, but to leverage the existing build scripts and configure build/release pipelines.
* VMs will need to be added to deployment groups. Make sure you are aware of how to install the agents.
* Don’t be afraid to whiteboard various processes to determine the best approach.
* Rollbacks don’t necessarily always mean rolling back code deployments. There are other methodologies for rolling back features and enhancements. Your team should consider and discuss pro’s/con’s of various methodologies.

## Tech tips

* Azure DevOps tenants are not yet uniform in their taxonomy. Some projects are created with the primary branch being named `main`, while others are still using `master`. Therefore, you may need to adjust the triggers of your _azure-pipelines.yml_ file.
* In the _network.bicep_ file, there are some undocumented REST properties which will create warnings when building the Azure Bicep definition. You can ignore these warnings.

  ```bash
  network.bicep(94,5) : Warning BCP037: The property "vnetEncryptionSupported" is not allowed on objects of type "NetworkInterfacePropertiesFormat". Permissible properties include "dnsSettings", "enableAcceleratedNetworking", "enableIPForwarding", "migrationPhase", "nicType", "privateLinkService", "workloadType". If this is an inaccuracy in the documentation, please report it to the Bicep Team. [https://aka.ms/bicep-type-issues]
  network.bicep(137,5) : Warning BCP037: The property "vnetEncryptionSupported" is not allowed on objects of type "NetworkInterfacePropertiesFormat". Permissible properties include "dnsSettings", "enableAcceleratedNetworking", "enableIPForwarding", "migrationPhase", "nicType", "privateLinkService", "workloadType". If this is an inaccuracy in the documentation, please report it to the Bicep Team. [https://aka.ms/bicep-type-issues]
  network.bicep(180,5) : Warning BCP037: The property "vnetEncryptionSupported" is not allowed on objects of type "NetworkInterfacePropertiesFormat". Permissible properties include "dnsSettings", "enableAcceleratedNetworking", "enableIPForwarding", "migrationPhase", "nicType", "privateLinkService", "workloadType". If this is an inaccuracy in the documentation, please report it to the Bicep Team. [https://aka.ms/bicep-type-issues]
  network.bicep(223,5) : Warning BCP037: The property "vnetEncryptionSupported" is not allowed on objects of type "NetworkInterfacePropertiesFormat". Permissible properties include "dnsSettings", "enableAcceleratedNetworking", "enableIPForwarding", "migrationPhase", "nicType", "privateLinkService", "workloadType". If this is an inaccuracy in the documentation, please report it to the Bicep Team. [https://aka.ms/bicep-type-issues]
  network.bicep(292,11) : Warning BCP037: The property "allowBackendPortConflict" is not allowed on objects of type "LoadBalancingRulePropertiesFormat". No other properties are allowed. If this is an inaccuracy in the documentation, please report it to the Bicep Team. [https://aka.ms/bicep-type-issues]
  network.bicep(293,11) : Warning BCP037: The property "enableDestinationServiceEndpoint" is not allowed on objects of type "LoadBalancingRulePropertiesFormat". No other properties are allowed. If this is an inaccuracy in the documentation, please report it to the Bicep Team. [https://aka.ms/bicep-type-issues]
  ```

* If your team is not familiar with Azure Bicep and feels more comfortable working with standard ARM Templates, it is acceptable to build the Azure Bicep definition locally, then leverage the ARM template for your deployments going forward. The goal is not to learn Azure Bicep, but to become familiar with infrastructure as code (IaC) and automated deployments. (Using Terraform is also acceptable, but doing so may be a waste of valuable time.)
* When testing deployments with `what-if`, you will receive a series of false-positives for changes in the external load balancer’s backend pools. See the warnings below for an example (your warnings may be slightly different based on the subscription and resource group). This is a documented bug in the REST API of the external load balancer.

  ```bash
  Note: The result may contain false positive predictions (noise).
  You can help us improve the accuracy of the result by opening an issue here: https://aka.ms/WhatIfIssues

  Resource and property changes are indicated with these symbols:
    - Delete
    ~ Modify
    = Nochange
    * Ignore

  The deployment will update the following scope:

  Scope: /subscriptions/905c7701-f724-4623-bcde-5753d61dd3d6/resourceGroups/webapp

    ~ Microsoft.Network/loadBalancers/elbwebapp [2020-11-01]
      ~ properties.backendAddressPools: [
        ~ 0:

          - properties:

              loadBalancerBackendAddresses: [
                0:

                  etag:                         "W/"eec77d44-f36a-4702-be91-a1ad6ae13143""
                  id:                           "/subscriptions/905c7701-f724-4623-bcde-5753d61dd3d6/resourceGroups/webapp/providers/Microsoft.Network/loadBalancers/elbwebapp/backendAddressPools/webapp/loadBalancerBackendAddresses/web1"
                  name:                         "web1"
                  properties.ipAddress:         "10.10.0.4"
                  properties.provisioningState: "Succeeded"
                  properties.virtualNetwork.id: "/subscriptions/905c7701-f724-4623-bcde-5753d61dd3d6/resourceGroups/webapp/providers/Microsoft.Network/virtualNetworks/vnet-webapp"
                  type:                         "Microsoft.Network/loadBalancers/backendAddressPools/loadBalancerBackendAddresses"

                1:

                  etag:                         "W/"eec77d44-f36a-4702-be91-a1ad6ae13143""
                  id:                           "/subscriptions/905c7701-f724-4623-bcde-5753d61dd3d6/resourceGroups/webapp/providers/Microsoft.Network/loadBalancers/elbwebapp/backendAddressPools/webapp/loadBalancerBackendAddresses/web2"
                  name:                         "web2"
                  properties.ipAddress:         "10.10.0.5"
                  properties.provisioningState: "Succeeded"
                  properties.virtualNetwork.id: "/subscriptions/905c7701-f724-4623-bcde-5753d61dd3d6/resourceGroups/webapp/providers/Microsoft.Network/virtualNetworks/vnet-webapp"
                  type:                         "Microsoft.Network/loadBalancers/backendAddressPools/loadBalancerBackendAddresses"

              ]


        ]
      ~ properties.loadBalancingRules: [
        ~ 0:

          - properties.backendAddressPools: [
              0:

                id: "/subscriptions/905c7701-f724-4623-bcde-5753d61dd3d6/resourceGroups/webapp/providers/Microsoft.Network/loadBalancers/elbwebapp/backendAddressPools/webapp"

            ]

        ]

    ~ Microsoft.Network/loadBalancers/elbwebapp/backendAddressPools/webapp [2020-11-01]
      ~ properties.loadBalancerBackendAddresses: [
        ~ 0:

          - etag:                         "W/"eec77d44-f36a-4702-be91-a1ad6ae13143""
          - id:                           "/subscriptions/905c7701-f724-4623-bcde-5753d61dd3d6/resourceGroups/webapp/providers/Microsoft.Network/loadBalancers/elbwebapp/backendAddressPools/webapp/loadBalancerBackendAddresses/web1"
          - properties.provisioningState: "Succeeded"
          - type:                         "Microsoft.Network/loadBalancers/backendAddressPools/loadBalancerBackendAddresses"
          ~ properties.ipAddress:         "10.10.0.4" => "[reference(resourceId('Microsoft.Network/networkInterfaces', 'web1nic')).ipConfigurations[0].properties.privateIPAddress]"

        ~ 1:

          - etag:                         "W/"eec77d44-f36a-4702-be91-a1ad6ae13143""
          - id:                           "/subscriptions/905c7701-f724-4623-bcde-5753d61dd3d6/resourceGroups/webapp/providers/Microsoft.Network/loadBalancers/elbwebapp/backendAddressPools/webapp/loadBalancerBackendAddresses/web2"
          - properties.provisioningState: "Succeeded"
          - type:                         "Microsoft.Network/loadBalancers/backendAddressPools/loadBalancerBackendAddresses"
          ~ properties.ipAddress:         "10.10.0.5" => "[reference(resourceId('Microsoft.Network/networkInterfaces', 'web2nic')).ipConfigurations[0].properties.privateIPAddress]"

        ]

    = Microsoft.Network/networkInterfaces/sqlsvr1nic [2021-02-01]
    = Microsoft.Network/networkInterfaces/web1nic [2021-02-01]
    = Microsoft.Network/networkInterfaces/web2nic [2021-02-01]
    = Microsoft.Network/networkInterfaces/worker1nic [2021-02-01]
    = Microsoft.Network/networkSecurityGroups/nsg-webapp [2020-11-01]
    = Microsoft.Network/publicIPAddresses/elbip [2020-11-01]
    = Microsoft.Network/publicIPAddresses/sqlsvr1ip [2020-11-01]
    = Microsoft.Network/publicIPAddresses/web1ip [2020-11-01]
    = Microsoft.Network/publicIPAddresses/web2ip [2020-11-01]
    = Microsoft.Network/publicIPAddresses/worker1ip [2020-11-01]
    = Microsoft.Network/virtualNetworks/vnet-webapp [2020-11-01]
    = Microsoft.Storage/storageAccounts/storwoodgrovesql000000 [2021-02-01]
    = Microsoft.Storage/storageAccounts/storwoodgroveweb000000 [2021-02-01]
    * Microsoft.Compute/disks/sqlsvr1_DataDisk_0
    * Microsoft.Compute/disks/sqlsvr1_DataDisk_1
    * Microsoft.Compute/disks/sqlsvr1_OsDisk_1_34f6e85dbc6b40d28a7ce54f7329ce86
    * Microsoft.Compute/disks/web1_OsDisk_1_ac7f0a99d6b2415da426dd61a7fc82f4
    * Microsoft.Compute/disks/web2_OsDisk_1_fce1a62dd3644822967bb719baf10ebc
    * Microsoft.Compute/disks/worker1_OsDisk_1_b0c7fd03cc71462da9c44449cff21fd0
    * Microsoft.Compute/virtualMachines/sqlsvr1
    * Microsoft.Compute/virtualMachines/sqlsvr1/extensions/CreateDatabase
    * Microsoft.Compute/virtualMachines/web1
    * Microsoft.Compute/virtualMachines/web1/extensions/DownloadWebFiles
    * Microsoft.Compute/virtualMachines/web1/extensions/InstallWebServer
    * Microsoft.Compute/virtualMachines/web2
    * Microsoft.Compute/virtualMachines/web2/extensions/DownloadWebFiles
    * Microsoft.Compute/virtualMachines/web2/extensions/InstallWebServer
    * Microsoft.Compute/virtualMachines/worker1
    * Microsoft.Compute/virtualMachines/worker1/extensions/CreateScheduledTasks
    * Microsoft.Compute/virtualMachines/worker1/extensions/DownloadWebFiles
    * Microsoft.SqlVirtualMachine/SqlVirtualMachines/sqlsvr1

  Resource changes: 2 to modify, 13 no change, 18 to ignore.
  ```

## References

* <a href="https://docs.microsoft.com/azure/devops/pipelines/" target="_blank">Azure Pipelines overview</a>
* <a href="https://docs.microsoft.com/azure/devops/pipelines/artifacts/build-artifacts?view=azure-devops&tabs=yaml" target="_blank">Artifacts in Azure Pipelines</a>
* <a href="https://docs.microsoft.com/azure/devops/pipelines/process/stages" target="_blank">Stages for Azure pipelines</a>
* <a href="https://docs.microsoft.com/azure/devops/pipelines/release/approvals/gates" target="_blank">Approval gates for release pipelines</a>
* <a href="https://docs.microsoft.com/azure/devops/pipelines/release/deployment-groups/howto-provision-deployment-group-agents?view=azure-devops" target="_blank">Provision agents for deployment groups</a>
* <a href="https://docs.microsoft.com/azure/azure-resource-manager/templates/bicep-install">Installing Azure Bicep</a>
* <a href="https://docs.microsoft.com/azure/azure-resource-manager/templates/bicep-overview" target="_blank">Azure templating with Bicep</a>
* <a href="https://azure.microsoft.com/blog/deployment-strategies-defined/" target="_blank">Deployment strategies defined</a>
* <a href="https://thenewstack.io/deployment-strategies/" target="_blank">Strategies for application deployment</a>

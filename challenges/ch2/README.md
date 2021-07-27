# Operationalize automated deployments

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

> **NOTE:** For all future challenges, you will be **required** to use Azure Bicep scripts and the build/release pipelines you configure in this challenge. Therefore, make sure you plan and build wisely. Additionally, be sure you know how the included Azure Bicep scripts are constructed so that you are able to correctly refactor them for your needs in future challenges.

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
### DevOps
* All repositories use the same naming convention for their build scripts. In the root folder of each repository, you will find its respective `azure-pipelines.yml` script.
* Azure DevOps has the following two projects:
  * _Bicep_: the Azure Bicep files to build the infrastructure
  * _Portal_: the customer portal web application
* The _Bicep_ project has a single repository (e.g. _bicep_)
* Under the _Portal_ project, you will find two repositories:
  * _web_: the source code for the web application
  * _processor_: the source code for the transactions processor timer job

### Azure DevOps Release Agents
When instantiating VMs that will host applications deployed from Azure DevOps build/release pipelines, you will need to deploy release agents on them. There are a few ways to automate this (e.g. imaging, DSC, PowerShell Remoting, etc.), but, unfortunately, none of them are very simple and all are time-consuming as there can be a lot of variation.

The simplest way is, once a new VM is instantiated, a DevOps engineer can RDP and deploy the agent manually. This process gives the DevOps engineer the best chance for success and greatest configurability. Because IaC, if done correctly, should only deploy a VM once, the engineer should only be required to deploy and configure the agent once.

A middle-ground approach is using Bicep/ARM templates to deploy the _Azure Pipelines Agent_. By using Bicep/ARM templates, the DevOps and systems engineers are able to work together in an IaC-approach to provisioning target VMs. The current Bicep scripts have been configured for this. The <a href="#references">References</a> section below provides some additional help, if needed.

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
## References
* <a href="https://docs.microsoft.com/azure/devops/pipelines/" target="_blank">Azure Pipelines overview</a>
* <a href="https://docs.microsoft.com/azure/devops/pipelines/process/stages" target="_blank">Stages for Azure pipelines</a>
* <a href="https://docs.microsoft.com/azure/devops/pipelines/release/approvals/gates" target="_blank">Approval gates for release pipelines</a>
* <a href="https://docs.microsoft.com/azure/devops/pipelines/release/deployment-groups/howto-provision-deployment-group-agents?view=azure-devops" target="_blank">Provision agents for deployment groups</a>
* <a href="https://docs.microsoft.com/azure/azure-resource-manager/templates/bicep-install">Installing Azure Bicep</a>
* <a href="https://docs.microsoft.com/azure/azure-resource-manager/templates/bicep-overview" target="_blank">Azure templating with Bicep</a>
* <a href="https://azure.microsoft.com/blog/deployment-strategies-defined/" target="_blank">Deployment strategies defined</a>
* <a href="https://thenewstack.io/deployment-strategies/" target="_blank">Strategies for application deployment</a>
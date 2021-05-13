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
* All repositories use the same naming convention for their build scripts. In each repository, you will find the respective `azure-pipelines.yml` script.
* Azure DevOps has the following three repositories:
  * _Bicep_: the Azure Bicep files to build the infrastructure
  * _Portal_: the source control for the customer portal web application
  * _Processor_: the source control for the transactions processor timer job

## Success criteria

## References

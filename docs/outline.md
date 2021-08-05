# Challenge Outline
The below defines the individual challenges, along with their abstract, any requirements, and their expected objectives.

## Overview
The **Well-Architected Framework OpenHack** attempts to test the participants' understanding of the Microsoft Well-Architected pillars. During the OpenHack, participants will demonstrate and practice a standardized process of conducting a Well-Architected assessment across all five of its pillars against a customer's workload.

The **Well-Architected Framework OpenHack** simulates a real-world scenario of a bank who has attempted to deploy a production workload to Azure.  Unfortunately, the bank was unaware of the Well-Architected pillars and proven design patterns, therefore, the production workload fails in many areas.

During the "hacking," attendees will focus on:
1) Analyzing and identifying enhancements to the customer's environment
2) Strengthening the customer's operational landscape
3) Ensuring that the customer's experience with the Microsoft cloud is of the utmost quality, value, and excellence

By the end of the OpenHack, it is expected that attendees will be familiar with the Microsoft Well-Architected Framework and able to conduct an assessment against a customer's workload in the Azure cloud.

## Business Outcomes
When conducting a Well-Architected Assessment, Cloud Solution Architects (CSAs) will follow the  standardized process outlined below. This standard process is designed to drive an expected, high-level business value to the customer and to Microsoft. By participating in this OpenHack, CSAs will:

- [ ] Perform detailed analysis of customer workloads within the Well-Architected Framework.  
- [ ] Solidify and demonstrate the knowledge of each pillar of the Well-Architected Framework.  
- [ ] Demonstrate the ability to follow the standardized process of technical assessments while maintaining expected quality and rigor.  
- [ ] Recognize the benefits of applying any pillar of the Well-Architected Framework against a customer's environment.  
- [ ] Identify the value of a wholistic application of the Well-Architected Framework against a customer's environment.  
- [ ] Deliver appropriate recommendations across all pillars of the Well-Architected Framework.  
- [ ] Accelerate and build their own technical intensity.  

## Technologies
* [Azure DevOps](https://docs.microsoft.com/azure/devops/)
* [Azure Bicep/ARM Templates](https://docs.microsoft.com/azure/azure-resource-manager/bicep/)
* [Azure Key Value](https://docs.microsoft.com/azure/key-vault)
* [Azure Traffic Manager](https://docs.microsoft.com/azure/traffic-manager)
* [Virtual Machines](https://docs.microsoft.com/azure/virtual-machines/windows/overview)
* [Azure App Service](https://docs.microsoft.com/azure/app-service/)
* [Azure SQL](https://docs.microsoft.com/azure/azure-sql/)
* [Azure Load Balancer](https://docs.microsoft.com/azure/load-balancer/)
* [Application Gateway - WAF v2](https://docs.microsoft.com/azure/application-gateway/)
* [Azure Front Door](https://docs.microsoft.com/azure/frontdoor/)
* [Azure Cost Management](https://docs.microsoft.com/azure/cost-management-billing/)
* [Azure vNets](https://docs.microsoft.com/azure/virtual-network)
* [Azure Service Endpoints](https://docs.microsoft.com/azure/virtual-network/virtual-network-service-endpoints-overview)
* [Azure Monitor](https://docs.microsoft.com/azure/azure-monitor/)
* [Azure Defender](https://docs.microsoft.com/azure/security-center/azure-defender)
* [Azure Sentinel](https://docs.microsoft.com/azure/sentinel/)
* [Grafana](https://grafana.com/docs/)

## Prerequisites
### Knowledge Prerequisites
To be successful and get the most out of this OpenHack, it is highly recommended that participants have a deep understanding (400+ level) of the following:
* [Microsoft Azure Well-Architected Framework](https://docs.microsoft.com/azure/architecture/framework/)
* [Cloud Design Patterns](https://docs.microsoft.com/azure/architecture/patterns/index-patterns)

Additionally, participants should be adequately familiar with the technologies listed above.

Finally, participants should have knowledge of the following technologies:
* [Azure DevOps Build/Release Pipelines](https://docs.microsoft.com/azure/devops/pipelines/get-started/what-is-azure-pipelines)
* [Azure Bicep](https://docs.microsoft.com/azure/azure-resource-manager/templates/bicep-overview)
* [Azure CLI](https://docs.microsoft.com/cli/azure/)
### Training Prerequisites
For preparation in passing the required challenges, participants are required to have completed all WAF training available via MS Learn. Additionally, it is expected that participants have completed pillar-specific hands-on learning labs.
### Language-Specific Prerequisites

### Tooling Prerequisites
To avoid any delays with downloading or installing tooling, have the following ready to go ahead of the OpenHack:
* A modern laptop running Windows 10 (1703 or higher), Mac OSX (10.12 or higher), or Ubuntu (16.04 or higher)
* Install your choice of Integrated Development Environment (IDE) software, such as [Visual Studio](https://visualstudio.microsoft.com/) or [Visual Studio Code](https://visualstudio.microsoft.com/)
* Download the latest version of [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
* Download the latest version of [Azure Bicep CLI](https://github.com/Azure/bicep/blob/main/docs/installing.md)
* For performance tests, install [k6 CLI](https://k6.io/docs/getting-started/installation/) (to install k6 CLI on Windows, you'll first need to install [Chocolatey Package Manager](https://chocolatey.org/install)) or install [Docker Desktop](https://docs.docker.com/engine/install/).
### Development Environment Configuration
* To build applications locally, participants will need to download and install [.NET Core 5.0 SDK](https://dotnet.microsoft.com/download) 
### Links & Resources
_TBD_
### Post-Learning Recommendations
_TBD_

## Challenges
### Challenge 1: Assess the environment
In this challenge, you will assess a customer's production environment that has been deployed to Azure and currently hosting a live workload. You will gain an understanding of the customer's current process for deployment and management of the applications and supporting cloud resources. Part of this understanding will include performing a cost analysis of the Azure environment and establishing some baseline performance metrics. Based upon the assessment, you will need to craft a plan to assist the customer in adoption and implementation of the Microsoft Well-Architected Framework. You will use this plan to govern how you proceed in future challenges.

**Required**  
Yes

**Learning Objectives**
* Inventory current components
* Identify potential areas of improvement
* Perform a cost analysis of the environment
* Conduct an initial performance test
* Conduct a load test against current business SLAs
* Conduct a stress test
* Establish and document performance baselines
* Understand the difference between the three types of performance tests
* Demonstrate a basic understanding of WAF
* Document any initial concerns for business meeting SLAs


### Challenge 2: Operationalize automated deployments
In this challenge, you will assist the customer in adopting automated deployments of both the application and infrastructure. You will explore the Azure Bicep scripts included in the Azure DevOps project and learn how to convert them to ARM templates for environment configuration and deployments. When helping the customer automate infrastructure and application changes, you will configure build and release pipelines. You will also attach deployment gates to release pipelines for security and governance of cloud resources. Deployments should ensure that only the correct resources should be removed by reporting changes _prior to_ being executed. It is important that you have a firm understanding of Azure Bicep and that your pipelines are configured correctly as **all future changes to the Azure environment must be conducted through the pipelines**.

**Required**  
Yes

**Learning Objectives**
* Create build/release pipelines in Azure DevOps
* Determine best strategy for deployments (conditions, types, etc.)
* Demonstrate "what-if" scenarios with deployments
* Configure gated deployments
* Discuss deployment models to maximize uptime


### Challenge 3: Planning for failure
It is not a matter of _if_ an environment will fail, but _when_. Therefore, prior to any changes being introduced into the application or its supporting infrastructure, it is important that proper monitoring and alerting be configured. In this challenge, you will determine what types of monitoring, along with the necessary data points, should be conducted. You will also determine and configure any necessary alerting of activities within your environment. These activities could include, but are not limited to, resource availability (or lack thereof), security threats, etc. Finally, you will determine a BCDR strategy in which you will implement in a future challenge.

**Required**  
Yes

**Learning Objectives**
* Discuss potential alerting options and processes
* Compose a list of metrics that should be monitored
* Compose a list of conditions that should generate an alert
* Configure alerting for determined conditions
* Demonstrate a successful alert
* Configure Azure Monitor and Security Center
* Enable Azure Sentinel
* Discuss BCDR strategy, including the varying costs of potential solutions relative to RPO/RTO/SLAs/KPIs
* Document BCDR strategy
* Identify points (roles) of contact for failures in the environment and construct a RACI chart


### Challenge 4: Visualizing operations
Now that significant planning and documentation has been completed, it is time to begin executing those plans. However, one last thing to consider is _visualizing_ changes across your environment. In this short challenge, you will take the composed list of metrics and conditions from the last challenge and build some operational dashboards. You will create a free Grafana account and link your Azure Monitor instance to it. You will then build some time-series reports and create an operational dashboard.

**Required**  
Yes

**Learning Objectives**
* Creating demo Grafana account
* Linking Azure Monitor to Grafana
* Creating operational dashboard in Grafana
* Reporting on IaaS resources
* Discuss the benefits and use cases of a real-time operational dashboard


### Challenge 5: Improve the environment
Before any changes are introduced into the current application architecture, the customer is interested in hardening what is currently deployed in terms of security, redundancy, and overall optimization. In this challenge, you will leave the application structure as-is&mdash;leaving it running on VMs&mdash;but you will implement some changes to the deployments and configurations of the environment. You will need to address secrets, potential areas of attack, and resiliency within the application. You will also need to make sure the telemetry is captured from the application and the virtual machine.

**Required**  
Yes

**Learning Objectives**
* Right-sizing VMs
* Redundancy of VMs using Availability Zones and proper storage configurations
* Securing network resources using NSGs
* Implementing JIT on VMs
* Discuss and properly configure RBAC based on RACI matrix
* Discuss options for securing database connection strings and implement a solution  
* Adding Application Insights to an application
* Configuring VM to send telemetry via Application Insights or Log Analytics agent
* Replacing ELB with Application Gateway and configuring OWASP
* Comparing performance to baselines and ensuring that business SLAs are met with changes in architecture
* Discuss potential cost improvements (Azure Reserved Instances)


### Challenge 6: Leveraging PaaS services
Often, customers choose to build their own environments for services already managed by Microsoft or its partners. This customer is no different. In this challenge, you will begin migrating the components of the web application to Azure's various PaaS offerings. As you migrate the application and configure its services, you must consider all pillars of the Microsoft Well-Architected Framework. With your implementation, you will need to ensure that all of the customer's SLAs are able to be met _at all times_ while maintaining adherence to the Microsoft Azure Well-Architected Framework. You will also need to make sure that your Grafana dashboards are updated to report desired metrics from the new resources. Finally, all alerts should be updated based on the new resources.

**Required**  
Yes

**Learning Objectives**
* Configuring Azure App Service for autoscale
* Securing Azure App Service
* Configuring Azure SQL for failover
* Using Key Vault in Azure App Service
* Enabling SQL Always Encrypted
* Leveraging private endpoints
* Using Azure Batch
* Continuing to compare performance to baselines and ensuring that business SLAs are met with changes in architecture
* Failing a region while maintaining performance SLAs
* Reporting on PaaS services


### Challenge 7: Optimizing the API
In the previous challenge, you may have elected to move the API to Azure Functions. If so, great! If not, here is your chance. In this challenge, you will separate the web front-end (WFE) from its services layer (API). Upon doing so, you will move the service layer to Azure Functions. In light of the Microsoft Azure Well-Architected Framework, you will also need to configure Azure Functions accordingly.

**Required**  
No

**Learning Objectives**
* Separating an application's front-end from its API
* Securing of Azure Functions
* Configuring autoscaling of Azure Functions
* Instrumenting Azure Functions with Application Insights
* Discuss the various billing models of Azure Functions and the reasoning behind which one was chosen in the case of this challenge
* Discuss the benefits of separating the two layers of the application
* Continuing to compare performance to baselines and ensuring that business SLAs are met with introduction of Azure Functions

### Challenge 8: Tightening database security
The application, unfortunately, is still using legacy database connection strings. This means that there are still identities (SQL or Azure AD) that are used to connect the application to the database. In this challenge, you will refactor your application to leverage managed identities for database connectivity and remove application-specific named users from the database.

**Required**  
No

**Learning Objectives**
* Using managed identities for database connectivity
* Understand and discuss the benefits of managed identities in terms of the Microsoft Azure Well-Architected Framework

### Challenge 9: Capturing correlation data
You have already introduced Application Insights into your application. However, the customer is finding it difficult to correlate errors between the web front-end and the backend. In this challenge, you will _discuss_ approaches to implementing the capturing of correlation data when an error occurs in the application. Remember, solutions should consider all pillars of the Well-Architected Framework.

**Required**  
No

**Learning Objectives**
* Discuss techniques for capturing correlation data
* Understand costs and security when storing correlation data
* Understand how processing correlation data can impact application performance
* Understand what data to capture in a distributed architecture


## Value Proposition
* Understand and clearly articulate the Microsoft Well-Architected Framework and each of its pillars, along with the respective benefits
* Systematically analyze a given workload under the individual lenses of the Well-Architected Framework pillars
* Deliver appropriate recommendations based on standard proven practices in accordance with the Well-Architected Framework
* Successfully implement and migrate existing workloads to optimize and strengthen said workloads in all pillars of the Well-Architected Framework
* Increase the overall technical intensity of technical team members

## Technical Scenarios
* _Performance_ - test and maintain, if not improve, performance of the application and its supporting infrastructure in order to meet specified SLAs
* _Resiliency_ - develop a BCDR strategy and architect an environment to which to migrate a customer's workload that will maximize uptime
* _Security_ - ensure that all connections to and from the application, including the database and its data, are secure, and verify access to cloud resources are restricted to necessary teams via appropriate RBAC policies
* _Modernization_ - transition a traditional, monolithic web application to modern PaaS services
## Audience
* Target Audience:
  * Microsoft - CE, CSE, CSA, GBB, ATT, CE, SE, TPM
  * Customer - Developers, Architects, SREs, DevOps Engineers, Systems Integrators, Systems Administrators
* Target Verticals: All
* Customer Profiles:
  * Customers who are looking to deploy new cloud-native applications and/or infrastructure into Azure and wish to have an assessment conducted on the workload prior to it going live.
  * Customers who currently have cloud-native applications running in production and are seeking visibility into optimization in terms of cost, security, reliability, and/or performance.
  * Customers who have migrated traditional, on-premises workloads to Azure and are seeking additional assistance in optimization for cloud operations.

## Registration Questions
| Required | Field | Response Options |
| -------- | ----- | ---------------- |
| **Yes**  | What is your level of understanding using Azure today?    | None<br />Some understanding<br />I have some pilot work on Azure<br />I rely on Azure today for cloud|
| **Yes**  | What is your level of understanding of the Azure Architecture Center? | None<br />Some understanding<br />I use it occasionally<br />I use it frequently |
| **Yes**  | What is your level of understanding of Cloud Design Patterns? | None<br />Some understanding<br />I reference them occasionally<br />I reference them frequently |
| **Yes**  | What is your level of understanding of the Microsoft Well-Architected Framework? | None<br />Some understanding<br />Intermediate knowledge<br />Expert

## FAQs
Q: Are there any pre-requisites to attending this OpenHack?  
   A: Yes. Attendees should have completed all MS Learn modules for WAF and the Hands-On Labs for the individual pillars.

Q: I have been working in Azure for years. Is this OpenHack really necessary?  
   A: Yes. There are elements of the Well-Architected Framework with which you may be unfamiliar. This OpenHack will help solidify your knowledge of all five pillars.

Q: I'm not a developer, so should I attend this OpenHack?  
   A. Yes. The Microsoft-Well Architected Framework is not just for developers, but for other technology professionals as well. This OpenHack is relevant to all IT professionals who work in the cloud, but it also gives insights into proven practices for on-prem environments.
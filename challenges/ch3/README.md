# Planning for failure

## Reminders
* Use an InPrivate/Incognito window in your browser to avoid any confusion with any other credentials that you may use to access Azure resources.
* The credentials you need to access the Azure subscription assigned to your team are available on the _OpenHack Environment_ tab.

## Challenge
Up to this point, Woodgrove Bank has been proud of the strides they have taken to adopt the cloud. They overcome quite a few hurdles internally and technically; they've made some mistakes along the way. But, all in all, Woodgrove Bank's technical teams consider their initial Azure implementation a success.

With all that has been done to date, however, Woodgrove Bank's IT team still realizes that there is considerable work that needs to be conducted before they consider themselves fully "cloud ready." A large part of this work includes planning for failure, along with monitoring and the proactive reporting of current resources. As stated in the _Overview_, Woodgrove Bank is currently operating a hot-cold distribution of resources on-prem, but are moving to the cloud for increasing overall value by reducing costs and increasing operational efficiency. The IT and security teams consider reporting and alerting a major component of this increase in value.

### Monitoring and alerting
In this challenge, you will discuss potential alerting options and processes for informing necessary audiences of various issues arising in the infrastructure and/or application. Your approach must be thoroughly designed and implemented. As you know, part of any alerting strategy involves answering the questions:

1. What elements within the environment must be monitored?
2. What conditions must be met by said elements to trigger an alert?
3. Who should be alerted when the condition(s) is/are met?
4. If the condition(s) is/are met, what is the impact to the business? 
5. How should the determined audience be alerted (e.g. email, SMS, phone, pager, carrier pigeon, etc.)?
6. How often should the determined audience be alerted?
7. What information is needed for each necessary audience?
8. What actions should be taken when a condition is met?
9. Who is responsible for those actions?

You must also determine the processes for information capturing, remediation, and distribution of RCA's (root cause analysis), if/when necessary. These processes should identify who is responsible for capturing information, applying any fixes or conducting any steps for remediation, and performing the necessary communication. Your team must deliver a completed RACI chart to your coach and be able to effectively communicate your approach.

Of course, design by itself isn't worth much. Being as such, you will also need to _implement_ your design on the customer's environment. You must deploy a Log Analytics workspace and then configure Azure Monitor and Azure Security Center to store their logs in that workspace. Additionally, you will need to deploy and enable Azure Sentinel within your Log Analytics workspace. Of course, as stated in the previous challenge, any and all challenges to the environment must now be conducted via the Azure Bicep scripts and deployed via ARM templates.

### Business Continuity/Disaster Recovery (BCDR)
In accordance with Woodgrove Bank's SLAs, the final element of this challenge is to _document_ and _implement_ a BCDR strategy. Your strategy should not only eet or excel Woodgrove Bank's composite SLAs, but each applicable service within the environment should also meet or excel the goal on its own. Being that Woodgrove is a financial institution, any outage of a single service is considered an outage to the environment overall as it will impact the customer experience, regardless of whether data is lost or not.

You will need to demonstrate to your coach that your application remains operational even when various components fail unexpectedly. Your coach will conduct a level of chaos testing against your environment. 

> NOTE: No re-architecting of the application should be done at this time. You are to stabilize the _current_ architecture as-is. If this means you need to add additional regions, VMs, load balancers, change various configuration settings, etc., so be it. However, Woodgrove Bank's architecture should continue to operate within an IaaS environment.

Remember, any Azure environment changes (or additions), must be done via Azure Bicep and ARM templates.

## Customer requirements
Before Woodgrove Bank continues to adopt the cloud and scale its operations in Azure, the IT team wants to make sure that all necessary monitoring and alerting is in place to main security, improve efficiency, and achieve operational excellence. Therefore, the IT team has communicated that the following must be enabled and configured within their tenant and the following deliverables provided to them for their records:

* A Log Analytics workspace is deployed and it must be capturing logs for all resources in the tenant. 

* In order to gain intelligent insights into operations, the Operations Team, along with other various teams, require that all logs in Log Analytics be kept for a minimum of 90 days.

* Given that Woodgrove Bank is subject to regulatory compliance, all logs be stored for no less than seven years.

* In order to maintain their security posture and monitor any potential threats, the Network Security team requires that Security Center be deployed.

* Additionally, Woodgrove Bank is exploring various cloud SIEM tools. Microsoft should deploy Azure Sentinel with Log Analytics and briefly demonstrate how to use it for querying data.

* Woodgrove Bank's Operations Team requires that alerts be determined and configured for their Azure implementation. The Microsoft team should be able to recommend and document an approach for alerting. Woodgrove Bank is looking to Microsoft for assistance and their recommendations in proven practices. 

* Woodgrove Bank's IT team is still familiarizing themselves with cloud operations. It, therefore, is relying heavily on Microsoft to assist in designing and implementing a BCDR strategy that meets its SLAs. Additionally, Woodgrove Bank is seeking documentation from the Microsoft team that outlines this strategy.

* Woodgrove Bank understands that its operational level is not as mature as it should be. As one more step to maturation, Woodgrove Bank is seeking help in creating a RACI chart for escalating alerts and failures within the application environment.

## Cheat sheet
* As stated multiple times, any additional products added to the Azure environment must be done via ARM templates and the Azure DevOps pipelines built earlier.

* Pay attention to the requirements for log retention. You wish wish to consider storing logs elsewhere besides _just_ Log Analytics in order to keep costs at a minimum.

* Pay attention to the suggested questions above when creating your RACI chart.  A strong RACI chart should answer those and other questions.

## Success criteria
In order to success in this challenge, you will need to accomplish the following:

* A solid process for alerting and notifications should be well-documented and effectively communicated to your coach.

* Should a failure be encountered, an alert should be successfully generated.

* Log Analytics and Security Center should be enabled for all resources in the Azure tenant. Logs, in some format, should be retained for a _minimum_ of 7 years.

* Azure Sentinel should be enabled for Log Analytics and the use of it should be adequately demonstrated to your coach. Be prepared to show how to query Log Analytics and Azure Sentinel to your coach.

* A BCDR strategy that meets or exceeds Woodgrove Bank's SLA requirements must be well-documented and effectively communicated to your coach.

* A RACI chart needs to be created that identifies the alerting and issue escalation process. It should include events, activities, deliverables, and individuals necessary for remediation.

## References
* <a href="https://docs.microsoft.com/azure/azure-monitor/alerts/alerts-overview" target="_blank">Alerting Overview</a>
* <a href="https://docs.microsoft.com/azure/azure-monitor/alerts/alerts-action-rules" target="_blank">Action Rules</a>
* <a href="https://docs.microsoft.com/azure/azure-monitor/logs/log-analytics-overview" target="_blank">Log Analytics Overview</a>
* <a href="https://techcommunity.microsoft.com/t5/azure-sentinel/best-practices-for-designing-an-azure-sentinel-or-azure-security/ba-p/832574" target="_blank">Best practices for designing an Azure Sentinel or ASC Log Analytics workspace</a>
* <a href="https://docs.microsoft.com/azure/sentinel/overview" target="_blank">Azure Sentinel Overview</a>
* <a href="https://docs.microsoft.com/azure/architecture/framework/resiliency/backup-and-recovery" target="_blank">BCDR for Azure applications</a>
* <a href="https://www.tacticalprojectmanager.com/raci-chart-explanation-with-example" target="_blank">RACI for identifying roles</a>
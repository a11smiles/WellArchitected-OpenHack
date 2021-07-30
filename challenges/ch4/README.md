# Visualizing operations

Time Length: **2-3 hours**

## Reminders
* Use an InPrivate/Incognito window in your browser to avoid any confusion with any other credentials that you may use to access Azure resources.
* The credentials you need to access the Azure subscription assigned to your team are available on the _OpenHack Environment_ tab.

## Challenge
With your help, Woodgrove Bank has moved closer to adopting practices that will increase their potential for successful, well-architected cloud implementations. However, the IT and development teams feel that they're not quite there yet. Woodgrove Bank, to this point, has implemented BCDR, alerting and monitoring, and they have established procedures for escalation of critical events. Additionally, they are capturing logs across all areas of their environment. However, the operations team needs real-time visibility into the environment. 

As an enterprise customer who is heavily utilizing the Microsoft Power Platform, the various IT teams have attempted to build a few dashboards in Power BI to monitor live metrics for on-prem resources. However, while Power BI has been fantastic for business intelligence dashboards, Woodgrove Bank feels that it is not ideal for real-time operational dashboards for monitoring their environments. Woodgrove Bank, and its operations team, specifically, is looking for a solution that will allow them to automatically cycle through various dashboards on their centralized monitors of the bank's Network Operations Center (NOC). Furthermore, until their migration to the cloud is complete and they are no longer operating on-premises, Woodgrove Bank is seeking a solution that will also allow them to query from multiple sources.

In this challenge, you will build upon your last endeavor by leveraging Log Analytics and Azure Monitor for delivering real-time dashboards to Woodgrove Bank. Because of the increasing complexity of Woodgrove Bank's cloud footprint and their technical requirements for displaying operational data from on-premises resources, Woodgrove Bank has chosen Grafana for their operational dashboards. 

Woodgrove Bank is seeking assistance and recommendations from Microsoft on what type of data to visualize and the best way to present/visualize it on their dashboards. They are also seeking recommendations in approaches to classify/group/organize data on the dashboards. 

Questions that they are asking include:

1) Should the dashboards be based on individual applications/workloads or based on similar components?
2) Should the dashboards be siloed to various teams (e.g. networking vs. security vs. infrastructure)?
3) What other types of data, besides numbers and percentages, can be presented?
4) How do we incorporate performance counters from various environment entities?
5) How do we report on custom data?
6) How should we manage security on the dashboards? Who can simply view the data vs. who can edit the dashboards?

## Customer requirements
Using Grafana for their operational dashboards, the network operations team, along with a few others, of Woodgrove Bank has communicated the following requirements:

* Access to Grafana must be authenticated using Microsoft Azure AD credentials.

* Security should be configured that allows some users to edit dashboards, while others can only view the dashboards.

* All Azure-related data must remain in Azure. Grafana should be configured to query directly from Log Analytics and/or Azure Monitor.

* Any on-premises data can be stored in a repository recommended by Microsoft. Woodgrove Bank is seeking a recommendation for the best technology to use to store this data for visualization.

* Considering some of the questions presented above, the dashboards (and their data) need to be configured based on Microsoft's recommended approach. 

* Dashboards should auto-refresh with a delay of no longer than 10 seconds.

* Because these dashboards will be displayed on the front-of-house (FOH) monitors in Woodgrove Bank's NOC, they need the dashboards&mdash;in whichever way they are configured&mdash;to automatically cycle through so that the operations team can maintain constant visibility across all workloads and resources.

## Cheat sheet
* Before jumping immediately into creating Grafana dashboards, it may be advantageous to first decide what type of data you wish to show. Then, you can quickly mock up the presentation of this data by creating some simple Azure Monitor dashboards. Upon completing the mock ups, Grafana dashboards can be more quickly designed.

* Azure Grafana Service is not yet available for preview. However, Grafana Cloud offers a free 14-day Pro license for up to 10 users without needing any payment information. (It converts to the free tier after 14 days.) _One team member_ should create a Grafana Cloud account and then share it with the other members of the team. You can sign-up for a trial Pro account on <a href="https://grafana.com/auth/sign-up/create-user?pg=prod-cloud-pricing&plcmt=pro" target="_blank">Grafana.com</a>.

* You will need to create an Azure App Registration and give that service principal _Log Analytics Reader_ access (RBAC) to your Log Analytics workspace.  Using the service principal, you can create a connection between Grafana Cloud and your Log Analytics workspace.

* Operational monitoring is not just about 0's and 1's for applications and infrastructure. Operational dashboards should also include other data points such as security, costs, etc. Be aware of all the data you began collecting in the previous challenge, and the data that you have access to in Azure, and be creative in what type of data you can present and how to present it effectively.

## Success criteria
Successfully completing this challenge requires that the following criteria be met:

* A Grafana Cloud account should be created and users should be authenticated via Microsoft Azure AD.

* A connection should be made between your Grafana Cloud tenant and the Woodgrove Bank Azure subscription.

* Dashboards need to be designed and configured based on your recommendations. You should be prepared to present and defend your design decisions to your coach.

* Dashboards must be designed to auto-refresh.

* Grafana should be configured to automatically cycle through dashboards.

* Determine the best approach to storing on-premises logs for presentation in Grafana, and communicate to your coach what approach you have chosen and why.

> NOTE: Woodgrove Bank is currently utilizing a 3rd-party service for on-premises log aggregation. Your challenge does _not_ include accessing and displaying on-premises data. For this challenge, you should simply determine a reasonable approach for Woodgrove Bank to store it in a way that they can visualize it through Grafana.

* Configure appropriate permissions to allow specific users to edit dashboards and other users to only view them.
## References
* <a href="https://azure.microsoft.com/blog/7-best-practices-for-continuous-monitoring-with-azure-monitor/" target="_blank">Best practices for Continuous Monitoring with Azure Monitor</a>
* <a href="https://grafana.com/grafana/plugins/grafana-azure-monitor-datasource/" target="_blank">Configuring Azure Monitor as a data source for Grafana</a>
* <a href="https://azure.microsoft.com/blog/azure-monitor-logs-in-grafana-now-in-public-preview/" target="_blank">Azure Monitor logs in Grafana</a>
* <a href="https://grafana.com/docs/grafana/latest/permissions/dashboard-folder-permissions/" target="_blank">Grafana permissions</a>
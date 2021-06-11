# Guide: Planning for failure
## Success Criteria
* A process for alerting and notifications should be documented. There is not necessarily a specific format that the team should use. However, it is imperative that the team has a documented approach that identifies events, their criticality and business impact, responsibilities, and remediation actions, including who should be notified and the pertinent information that should be provided to them.
* Alerts should also include monitoring for system thresholds (e.g. memory, CPU, disk IOPS, etc.).
* You will need to run the enclosed script against the workload to ensure that an appropriate alert is successfully generated.
  
    **NOTE:** The included chaos script is not truly _random_. Instead, it will demote a specified resource. Given that the environment shouldn't have changed too much and only another region has been added, the script should work as expected. As a coach, you will need to be aware of the names of the resources in your team's subscription. A name will need to be supplied to the script so that it can be referenced successfully.
* The application should still be accessible and fully functioning when the resource fails under the "chaos test."
* Log Analytics and Security Center should be enabled in the subscription for all resources.
* Logs should be retained for no less than 7 years.
* Azure Sentinel should be enabled and the team should demonstrate querying for specific results.
* A BCDR strategy must be documented by the team and each team member should be aware of the selected strategy. They must communicate this strategy to you and demonstrate their technical knowledge. The team should be able to communicate areas of traffic distribution and data backup and replication. The strategy must meet or exceed Woodgrove Bank's RPO and RTO goals.
* A second region (US West) should be deployed with the same resources as currently in US East. The two regions should be configured with load balancing to ensure maximum uptime and to meet Woodgrove Bank's SLA of 99.99%.
* A RACI chart should be created to identify the components in the architecture, their impact to the success of the application, and who/which teams at Woodgrove Bank is/are responsible should they become unavailable. 
## Hints/Suggestions
* In addition to injecting logs into the Log Analytics workspace, the team should have logs being stored in _cold_ storage for no time period less than 7 years. (Azure Log Analytics only stores logs for up to 2 years. Additionally, cold storage will minimize costs.)
* Deploying Azure Sentinel with Bicep/ARM is quite simply a naming convention used by ARM. See the links below for additional assistance.
* Possible queries to consider for Azure Sentinel:
  * TBD
  * TBD
  * TBD
* While duplicating a second region should be a fairly simple process of copy/paste, the team will still need to be aware (and maintain) naming conventions along with ensuring that all deployed resources are indeed deployed to the correct regions. Other items to be aware of are:
  * Ensuring that the VMs are _not_ using the same storage account in either region.
  * Attaching a new storage device to the VM and moving data _off_ of the ephemeral storage (D:) onto the new drive.
* Being that the current architecture is fairly simplistic, the initial RACI chart won't be too complex. Instead, the intent is to familiarize the team with a RACI chart and have them discuss its components. You may wish to guide them through the process by first asking them to list all the components of the application. Keep in mind that components include software, hardware, and any other dependencies. Then, for each component identified, have them discuss how much the application will be impacted should that component become unresponsive, and who is responsible.

## References
* <a href="https://azsec.azurewebsites.net/2019/12/31/azure-sentinel-arm-template/" target="_blank">Deploying Azure Sentinel with ARM</a>
* <a href="https://medium.com/threat-hunters-forge/it-is-biceps-day-flexing-an-arm-template-to-deploy-azure-sentinel-d4709a3aa947" target="_blank">Deploying Azure Sentinel with Bicep</a>

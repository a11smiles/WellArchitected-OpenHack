# Guide: Improve the environment

## Success Criteria
There are many ways the team can improve Woodgrove Bank's environment. The below is a sample list of possibilities.

> NOTE: Some of the improvements below may have already been implemented in previous challenges. If so, you can consider _how well_ those implementations have been and whether they require any further improvement.

* All changes to the environment must be accomplished via the Azure Bicep/ARM Templates, and the application, for this challenge, must remain on the virtual machines.

* The current VMs are not correctly sized; some are too large and others are too small. This affects cost and performance of the application. The team should ensure that the VMs have been right-sized.

* All traffic&mdash;public and private&mdash;on the VMs are across a single NIC. This can affect performance and is not secure for database traffic. An additional subnet should be created with an additional NIC added to each application-tier VM on this subnet. The SQL server should be moved to this second, _private_ subnet. The multi-homing of the VMs restricts SQL data from traversing public networks.

* There are currently no firewall policies to restrict access to the Woodgrove Bank Azure network and its resources. NSGs should be configured properly to restrict traffic to the web servers and SQL servers as appropriate.

* The current environment has no RBAC policies implemented. Based on the RACI matrix the team created in a previous challenge, they should assign RBAC policies to the correct individuals/teams so that those teams have appropriate access to resolve any issues that may arise.

* A resolution that should have been accomplished in _Challenge 3_ is attaching a new data disk to the VMs and moving the data folders from the ephemeral (D:) drive.

* Additionally, another resolution from _Challenge 3_ is ensuring that the VMs are not sharing the same storage account.

* The virtual machines should leverage Availability Zones for their storage.

* The virtual machine that hosts the background services should have an on/off schedule configured via Azure Automation in order to reduce costs.

* JIT should be enabled for remote access to the virtual machines.

* Instead of direct RDP access from any network to the virtual machines, the team should consider a single jump box that allows RDP access from a restricted set of IP addresses and allows users to access other machines on the network. Another option is for the team to implement Azure Bastion service for accessing the virtual machines.

* The traffic manager should be replaced with an Application Gateway v2 with Web App Firewall. Besides the standard SSL certificate for securing traffic, OWASP will prevent harmful data from reaching the application servers. Grafana dashboards should be updated to report operational metrics from the Application Gateway.

* Currently, the database connection string is stored in an Azure DevOps variable library. The connection string should be moved to an Azure Key Vault and referenced by the Azure DevOps library for releases.

* Only specific users should have access to Key Vault. Key Vault should be configured via RBAC or Access Policies.

* Azure DevOps is currently configured to connect at the subscription level. This is acceptable for the infrastructure deployment, but not for the application deployment. The application deployments should be configured to connect the the Azure environment via a service principal. That principal should only have access to the appropriate virtual machines and/or resource groups.

* A potential cost improvement is Woodgrove Bank purchasing reserved instances. The team will not actually be able to implement this in the OpenHack, but you should question them on this.

* Application Insights should be added to the application and metrics should be collected from the application and the virtual machines. Additionally, dashboards should added to Grafana that report the collected metrics and performance counters.

* With any changes that the team implements, they must not degrade application performance. The performance tests should return the same or better performance metrics.

* The team should be able to adequately describe the stages of the ACHIEVE process.

## Hints/Suggestions
* This challenge, by far, will be the most intensive and time-consuming. The entire team must be engaged to accomplish all of the potential changes. You as the coach should be actively participating to ensure that the team continues to progress.

* The team may want to consider creating fictitious Azure AD groups that correspond the the Woodgrove Bank teams they identified for the RACI matrix. This will allow them to assign appropriate RBAC policies across the environment.

* The team will need to add the `<placeholder>` IIS App Pool identity to the `Performance Monitor Users` permission group so that Application Insights has access to the virtual machine's performance counters.

* The NSG on the web servers should only allow access across the public network on ports 80 (HTTP) and 443 (HTTPS). The private network should only allow access through port 1433 (SQL). RDP (port 369) should only be allowed to certain IP addresses on both networks (and/or use Azure Bastion). 

## References
_None._
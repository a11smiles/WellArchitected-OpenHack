# Guide: Assess the environment

## Success Criteria

* The attendees will need to be able to describe each pillar of the Microsoft Well-Architected Framework (e.g. Cost Optimization, Operational Excellence, Performance Efficiency, Reliability, and Security) along with each respective pillar's core principles.
* The attendees should have a list of all components in the architecture and demonstrate that they have researched the configuration. This list should _not_ just include what's shown in the architecture diagram. Instead, it should also include components such as:
    * NSG configurations
    * shared blob storage
    * RBAC configurations
    * Azure AD configurations
    * how the application is configured on the VMs (connection strings, file locations, IIS, etc.)  
* Attendees concerns should include, but should not be not limited to:
    * lack of RBAC configuration
    * connection strings not being encrypted
    * credentials being stored in the database
    * VM right-sizing
    * inability to scale
    * VMs sharing the same storage
    * no availability zones
    * lack of BCDR

>_Completeness of the above two inventories is absolutely essential as it will serve as a compass for the team moving forward through remaining challenges._

* Attendees should demonstrate how to perform a _Cost Analysis_ on the current subscription.
* Attendees should add tags to the resources in the current workload based on department and demonstrate how to filter costs based on the department.
* Attendees should demonstrate how to use the Azure Pricing Calculator to estimate costs of future workloads.
* Attendees should demonstrate and document load testing of the application.
* Attendees should demonstrate and document stress testing of the application. At what point does the application fail?

## Hints/Suggestions

* While it is _ideal_ that all architects know the Microsoft Well-Architected Framework, given the time constraints of the OpenHack, this may not be entirely possible. It may be a better use of the team's time for the attendees to split up the pillars among themselves. Each pillar can then be researched independently and team members can inform their colleagues on the pillars and their respective core principles.
* One customer requirement identified in the _Overview_ is that only users who have a Woodgrove Bank AD account&mdash;no guest user&mdash;should have access to Azure resources. This should be noted by the team.
* Filtering workloads for the _Cost Analysis_ tool can be accomplished using tags. The department for the current workload was mentioned in the OpenHack overview. The owner of this workload is the "Customer Experience" business sector, or department.
* Attendees should know how to conduct a performance test. There are a number of free tools available. However, if they do not have a preferred tool, it is recommended that they familiarize themselves with the basics of k6. The sample script found in the _Cheat sheet_ section is heavily documented. Team members should be encouraged to save the script and edit it as needed based on their preferred stages and thresholds.

## References

* <a href="https://docs.microsoft.com/azure/architecture/framework/" target="_blank">Microsoft Well-Architected Framework</a>
    * <a href="https://docs.microsoft.com/azure/architecture/framework/cost/" target="_blank">Cost Optimization</a>  (<a href="https://docs.microsoft.com/azure/architecture/framework/cost/overview" target="_blank">Core Principles</a>)
    * <a href="https://docs.microsoft.com/azure/architecture/framework/devops/overview" target="_blank">Operational Excellence</a> (<a href="https://docs.microsoft.com/azure/architecture/framework/devops/principles" target="_blank">Core Principles</a>)
    * <a href="https://docs.microsoft.com/azure/architecture/framework/scalability/overview" target="_blank">Performance Efficiency</a> (<a href="https://docs.microsoft.com/azure/architecture/framework/scalability/principles" target="_blank">Core Principles</a>)
    * <a href="https://docs.microsoft.com/azure/architecture/framework/resiliency/overview" target="_blank">Reliability</a> (<a href="https://docs.microsoft.com/azure/architecture/framework/resiliency/overview" target="_blank">Core Principles</a>)
    * <a href="https://docs.microsoft.com/azure/architecture/framework/security/overview" target="_blank">Security</a> (<a href="https://docs.microsoft.com/azure/architecture/framework/security/security-principles" target="_blank">Core Principles</a>)
* <a href="https://docs.microsoft.com/azure/cost-management-billing/costs/quick-acm-cost-analysis?tabs=azure-portal" target="_blank">Quickstart: Explore and analyze costs with cost analysis</a>
    * <a href="https://docs.microsoft.com/azure/cost-management-billing/costs/cost-analysis-common-uses#view-costs-for-a-specific-tag" target="_blank">Viewing costs based on tag</a>
* <a href="https://www.blazemeter.com/blog/performance-testing-vs-load-testing-vs-stress-testing" target="_blank">Performance Testing vs. Load Testing vs. Stress Testing</a>
* <a href="https://docs.microsoft.com/azure/active-directory/enterprise-users/users-restrict-guest-permissions" target="_blank">Prevent inviting guests to AD tenant</a>

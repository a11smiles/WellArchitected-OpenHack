# Leveraging PaaS services

## Reminders
* Use an InPrivate/Incognito window in your browser to avoid any confusion with any other credentials that you may use to access Azure resources.
* The credentials you need to access the Azure subscription assigned to your team are available on the _OpenHack Environment_ tab.

## Challenge
Due to your hard word and commendable diligence, Woodgrove Bank's IT team is beginning to grasp the foundational concepts of the Microsoft Azure Well-Architected Framework. They understand the basis for the groundwork that you have laid and they are ready to move forward in transforming the application's underlying services. However, given that Woodgrove Bank is understanding is rooted in on-premises virtualization and cloud hosting technologies are new, they still wish to move in a fashion that allows them to learn. As stated in previous challenges, Woodgrove Bank desires to leverage this application as a model for transforming other applicable workloads in the future.

In this challenge, you will transition current workloads from IaaS to PaaS, where available. As you know, Azure offers many solutions for various customer workloads. Your team will need to determine the best suitable solution for Woodgrove Bank's application and be able to to justify your approach.

It is important you remember that Woodgrove Bank's current workload is _production_. So you must continue to work in a _non-destructive_ manner. You should consider how you will successfully transition the workload from IaaS to PaaS without incurring unnecessary downtime. Additionally, all work completed to this point in regard to security, monitoring, performance, costs, etc. will need to be updated for the new resources.

## Customer requirements
As stated above, Woodgrove Bank is very anxious about moving to PaaS services. Their teams have identified some of the following concerns and requirements.

* The business requires that, during the transition, the current web application remains completely operational and accessible by their customers.

* The business stakeholders and the IT team want to ensure that costs are managed efficiently. With VMs, including reserved instances, budgets were slightly more predictable, but they do not know how to prepare budgets for PaaS. Woodgrove Bank cannot allow costs to grow without restraint and need instruction on how to adequately calculate PaaS costs.

* For virtual machines, IT could limit access to specific users. However, the IT and security teams are concerned with configuration values (e.g. database connection strings, API tokens, etc.) being accessible to all users.

* Within a network, database and information access during transit could be contained. However, the IT and security teams are now concerned that moving to PaaS would expose their data as it passes through the public Internet.

* The security teams want to ensure that all PaaS services are leveraging the latest security standards. Any communication with the applications should follow the most recent security practices. Additionally, if App Services are used for hosting the application's components, access to the application files should be limited to SCM only.

* The IT team only wishes to be involved in the change management where necessary. Therefore, automation should be leveraged for configuration of the infrastructure _and_ the application as much as possible.

* Woodgrove Bank's IT team needs Microsoft to ensure that the delivered solution maintains RPO/RTO requirements and that it is highly-available at all times.

* Woodgrove Bank's development team requires that the application does not experience a degradation in performance due to the transition from IaaS to PaaS.

* The IT and operations teams still require complete visibility into the application and its supporting infrastructure. Therefore, Microsoft will need to demonstrate the reporting capabilities and update any necessary dashboards.

## Cheat sheet
As you consider your approach, remember that, while this OpenHack only appears to be servicing two customers of Woodgrove Bank, your solution must, in reality, be able to support their 100k+ customers. This is especially critical for nightly batch processing of posted transactions as each customer may have anywhere from a few handful to many posted transactions. Therefore, consider how you could "configure" parallelization for the background service.

## Success criteria
As you work through this challenge, it may be helpful to examine the inventory of components that are currently in the customer's environment. Then, determine what PaaS services, if any, can be mapped to the IaaS services you have identified. Finally, determine the process you will undergo for transitioning the services from IaaS to PaaS.

Again, practice the _ACHIEVE_ method that you learned in the _Challenge 5_.

To succeed in this challenge, you must address the customer requirements listed above. The following are some questions to consider. 

* What service(s) will you use for the customer-facing web application?
* What service(s) will you use for the scheduled, background service job?
* How will you host the SQL database?
* How will you manage costs for the above services?
* How will you maintain performance for the above services?
* How will you configure BCDR and high-availability for the above services?
* How will you secure configurations?
* How will you secure data between the application and the database?
* What alerts are necessary and should you configure for the above services?
* What metrics should you configure for the above services?



## References
* <a href="https://azure.microsoft.com/blog/application-packages-and-task-dependencies-now-available-on-azure-batch/" target="_blank">Azure Batch Application Packages</a>
* <a href="https://docs.microsoft.com/azure/batch/batch-application-packages" target="_blank">Deploying Application Packages to compute nodes</a>
* <a href="https://docs.microsoft.com/azure/devops/pipelines/tasks/utility/archive-files?view=azure-devops" target="_blank">Archive Files task in Azure DevOps</a>
* <a href="https://docs.microsoft.com/azure/azure-sql/database/always-encrypted-azure-key-vault-configure" target="_blank">Configuring SQL Always Encrypted</a>
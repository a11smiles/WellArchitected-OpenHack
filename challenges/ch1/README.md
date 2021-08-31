# Assess the environment

Time Length: **4-5 hours**

## Reminders

* Use an InPrivate/Incognito window in your browser to avoid any confusion with any other credentials that you may use to access Azure resources.
* The credentials you need to access the Azure subscription assigned to your team are available on the _OpenHack Environment_ tab.

## Challenge

Your challenge is to conduct an initial assessment of Woodgrove Bank's Azure implementation for their customer portal. Its implementation is a "first attempt" to deploy a workload and is based off of a standard configuration the bank's IT team uses on-premises. Remember, this is the first of many workloads, so the findings you uncover here and the practices you set forth will be followed by Woodgrove Bank as it moves additional workloads into Azure. This challenge has some, but very little, hands-on implementation. The majority of this challenge is about _discovery_ and creating a plan for moving forward.

It is imperative for Woodgrove Bank (and your future challenges) that you perform a solid assessment of their cloud application and its supporting infrastructure. As you do so, you will determine the process, tools, and technologies for future assessments and migrations/re-architecting as Woodgrove Bank attempts to build its applications as cloud-native for Azure. Equipped with your knowledge, and by following the Microsoft Azure Well-Architected Framework's guidance, you and your team must work through the customer requirements while reviewing the current application environment and Woodgrove Bank's operations to provide sound guidance to the bank for improving its current and future workloads.

This time should should be spent on deeply familiarizing yourself with the Microsoft Azure Well-Architected Framework, Cloud Design Patterns, and the customer's current implementation. Your team will be required to present an assessment of the application environment based on the pillars of the Microsoft Azure Well-Architected Framework. Consider the following questions for thought:

* What resources are most expensive? Are there any ways to reduce costs without sacrificing the other pillars?
* Is there a way to automate deployments of Woodgrove Bank's infrastructure and applications?
* How well does the current implementation handle load? What's the _maximum_ load the current implementation can handle? What can you do to increase load thresholds?
* How reliable is the current implementation? Where are the points of failure? What's the current implementation's _composite_ SLA?
* What does Woodgrove Bank's BCDR landscape look like currently?
* What areas of the application/environment are most likely to be breached? In what ways can you tighten security?
* How much of what you've thought of in the previous questions can be accomplished without changing the current infrastructure?
* What changes to the current infrastructure (and application, if necessary) would be required to improve the environment across all pillars of the Microsoft Azure Well-Architected Framework? How will these changes affect overall costs?

As you answer the questions above, make sure you review the business drivers, goals, and SLAs that the business has identified in the _Overview_. These factors may require you to adjust your decisions.

At all times, remember to make no assumptions and always keep the customer's goals in view. The customer's business drivers and goals must always be seen through the lenses of the Microsoft Azure Well-Architected Framework. This is how you will succeed in this challenge and with the workloads of your real customers.

> **NOTES:**
>
> * While Woodgrove Bank may consider multiple subscriptions at a later time for development, testing, staging, etc., you should assume that Woodgrove will only leverage a single subscription for the time being, and that this subscription will host all of its workloads&mdash;development, staging, and production.
> * Woodgrove Bank uses a 3rd-party, globally-distributed DNS. The scope of this OpenHack exists _behind_ the DNS. You should assume that whatever you implement can be accessible upon a DNS update. For the OpenHack you should access the web application via its external load balancer, or with whatever you choose to replace the ELB. The only exception is that the resource **must** be configured to accept web requests via a properly-configured DNS record (A, CNAME, etc.).

## Initial Assessment

In preparation for their engagement with Microsoft, Woodgrove Bank has completed an initial Microsoft Azure Well-Architected Assessment. The questions have been answered to the best of their understanding and additional notes have been provided where they felt additional clarity was necessary. The results of that assessment, in a modified, readable format, are located under the _Resources_ tab in the OpenHack portal (_Woodgrove_Bank_Assessment_2021-08-31.pdf_).

## Customer requirements

Woodgrove Bank has the following requirements which you should take into consideration:

* Microsoft should have a solid understanding of Woodgrove Bank's application and supporting infrastructure before proceeding. Woodgrove Bank is looking to Microsoft for guidance on properly assessing a given workload and re-architecting it as cloud-native. The Microsoft team should be prepared to clearly communicate and demonstrate, where necessary, any findings and make the proper recommendations.
* Woodgrove Bank is aware of the upcoming changes in its operational model. What Woodgrove Bank does not understand is how to plan for the budgeting of resources. Woodgrove Bank's IT team needs Microsoft to show how to report current costs and run analysis on specific workloads. Because Woodgrove Bank would like to charge workloads back to their respective cost centers, Woodgrove Bank would like to know how to report on all workloads belonging to any given department.
* As the IT and development teams work together to introduce new technologies, the IT team needs to understand what the potential costs are for a given product and its SKU. The Microsoft team should demonstrate how to calculate a budget for future workloads.
* The security and operations teams require that the recommended cloud adoption plan should adhere to a _least-privilege_ policy and that no non-domain user has access to the Azure environment. Additionally, securing these resources should conducted via role-based access control and managing the privileges should simplified where possible.
* The application in its current state is considered "MVP" (minimum viable product) based on a legacy, previously-used web application. There will be additional components and services added to the application in the coming months. With the introduction (or reintroduction) of those components along with business expansion, it is expected that load will increase dramatically. IT and development teams need recommendations from Microsoft for performance improvements to the application that would allow it to scale appropriately.
* Any implementation should meet or exceed Woodgrove Bank's SLA requirements.

## Cheat sheet

### Network

Woodgrove Bank has attempted to implement an infrastructure that is somewhat identical to their on-premises implementations for web applications while ensuring that there is no CIDR overlap. All resources are on a single virtual network and exist in the same resource group.

* Resource Group: **webapp**
* The virtual network called **vnet-webapp** has the following attributes:
    * Address space: **10.10.0.0/16**
    * Subnets:
        * dmz: **10.10.0.0/28**
        * jobs: **10.10.0.16/28**
        * sql: **10.10.0.32/27**

### Performance Tests

To run performance tests, you can leverage <a href="https://k6.io" target="_blank">k6</a>. A heavily-documented sample script along with basic instructions can be found in the OpenHack portal. All you will need to do is update the URLs in the script and execute it against the Woodgrove Bank application endpoints. You can follow the instructions included with the k6 script to configure it and execute it within your environment.

Note that k6 is not required and you may use any other tool you prefer, but you must be able to demonstrate adequate knowledge of the test results.

> **NOTE:** As you conduct performance tests for your customers, if you find they are not currently using any performance testing tools, you can point them to a sample k6 script in the <a href="https://github.com/Azure/WellArchitected-Tools" target="_blank"> Well-Architected Framework Tools</a> repo. The repo is public and the script is designed to be easily modified based on the needs of the user. This can be a great learning opportunity for your customer.

## Success criteria

In order to succeed in this challenge, you will need to present a number of items to your coach along with demonstrating your knowledge across multiple areas. Your success in the future challenges of this OpenHack depend _heavily_ on your ability to lay the foundation in this challenge.

Be ready to present to your coach the following:

* You will need to soundly communicate the goals and principles of each pillar of the Microsoft Azure Well-Architected Framework. Before any actual re-architecting is conducted, assessment of the current workload should be performed via the individual _and_ collective lenses of the Microsoft Azure Well-Architected Framework pillars.
* You will need to inventory all components in the current architecture. These components should include everything from the hardware to software layers. Additionally, you will need to be able to identify how these components are configured and how they operate with each other. (Simply reciting the architectural diagram from the overview will not be sufficient.)
* What areas of the current architecture can be improved? As you present your inventory, be sure to highlight all concerns and areas for improvement. This areas could include, but are not limited to software, hardware, configuration, etc.
* What are the current and future costs of the workload(s), and how can IT determine workloads owned by a given department in order to conduct chargebacks? Be prepared to show current overall costs of the subscription along with filtering the workloads by department. Additionally, be prepared to discuss ways in which Woodgrove Bank can determine costs for future workloads they migrate to the cloud.
* What are the current performance baselines for the application? You will need to conduct a series of performance tests against the current application in order to determine current performance along with gauging performance changes as the cloud implementation changes. The performance tests should include load tests and stress tests, and they should be documented for future reference. Be prepared to describe load test stages and why you chose/configured the stages that you did. Also, be prepared to describe the thresholds you configured and why you chose/configured your particular thresholds. Finally, be able to explain the differences between performance, load, and stress testing.
* What is the current composite SLA? Do you have any concerns regarding the business meeting its requirements or SLAs? If so, communicate them with your coach.

As an Azure architect, you may be accustomed to implementing solid workloads in the cloud. However, many customers are not. It is important that you are able to understand and _articulate_ the reasoning behind your decisions. Much of this challenge centers around your ability to clearly communicate your own understanding to the customer in regard to the Microsoft Azure Well-Architected Framework and proven cloud practices.

## References

* <a href="https://docs.microsoft.com/azure/architecture/framework/" target="_blank">Microsoft Well-Architected Framework</a>
* <a href="https://docs.microsoft.com/azure/architecture/patterns/" target="_blank">Cloud Design Patterns</a>
* <a href="https://docs.microsoft.com//azure/architecture/guide/architecture-styles/n-tier" target="_blank">N-tier architecture style for cloud applications</a>
* <a href="https://docs.microsoft.com/azure/architecture/guide/design-principles/" target="_blank">Ten design principles for Azure Applications</a>
* <a href="https://docs.microsoft.com/azure/architecture/best-practices/index-best-practices" target="_blank">Best practices for cloud applications</a>
* <a href="https://docs.microsoft.com/azure/architecture/antipatterns/" target="_blank">Performance testing and antipatterns for cloud applications</a>
* <a href="https://docs.microsoft.com/azure/cost-management-billing/" target="_blank">Azure Cost Management and Billing</a>
* <a href="https://azure.microsoft.com/pricing/" target="_blank">Azure pricing</a>
* <a href="https://docs.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging" target="_blank">Naming conventions for Azure resources</a>
* <a href="https://docs.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-tagging" target="_blank">Tagging resources in Azure</a>
* <a href="https://docs.microsoft.com/aspnet/core/host-and-deploy/iis/?view=aspnetcore-5.0" target="_blank">Hosting an ASP.NET Core website in IIS</a>
* <a href="https://docs.microsoft.com/aspnet/core/mvc/overview?view=aspnetcore-5.0" target="_blank">Overview of ASP.NET Core MVC</a>
* <a href="https://docs.microsoft.com/aspnet/core/tutorials/first-mvc-app/working-with-sql?view=aspnetcore-5.0&tabs=visual-studio" target="_blank">Connecting an ASP.NET Core application to SQL</a>

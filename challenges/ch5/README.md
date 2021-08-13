# Improve the environment

Time Length: **3-4 hours**

## Reminders

* Use an InPrivate/Incognito window in your browser to avoid any confusion with any other credentials that you may use to access Azure resources.
* The credentials you need to access the Azure subscription assigned to your team are available on the _OpenHack Environment_ tab.

## Challenge

With each additional measure of maturity that has been introduced into Woodgrove Bank's Azure tenant, their confidence level has increased. Woodgrove Bank is beginning to understand how to improve their operations by leveraging cloud resources, and they are starting to see the benefits of the Microsoft Well-Architected Framework. All of this is a result of your hard work thus far. Great Job!

With the foundation set, Woodgrove Bank is looking to begin improving their infrastructure. But, they want to proceed slowly. After all, for a company who has been operating in the world of virtual machines in an on-premises data center, it's going to take some time and effort to truly comprehend the cloud. This is a learning process for the company and they are requesting you to help transform, not only their technical operations, but their understanding as well. Woodgrove Bank wishes to watch a transformation of their current cloud environment so that they understand how to proceed on their own in the future.

In this challenge, you will take the current infrastructure and, using the same type of technologies, improve Woodgrove Bank's configurations. Keep in mind that, because Woodgrove Bank is seeking to learn through this transformation, they are not ready to transition the application from IaaS to PaaS&mdash;you must improve what's there currently, where possible. While you may find it simple to immediately transition the application to PaaS, this will not help Woodgrove Bank in regard to other workloads because not all of their applications are ready for PaaS. In short, they must also understand how to well-architect and optimize IaaS resources. The exception to this rule is that you may _add_ or _replace_ components as long as the VMs and their applications remain in place.

As you plan this challenge, it may help you to do the following:

* List all 5 pillars of the Microsoft Well-Architected Framework.
* Review your findings from _Challenge 1_.
* Determine how your findings align to each pillar of the Microsoft Well-Architect Framework.
* Based on what you've implemented thus far, are there any new assessments?
* Determine what of those findings can be accomplished without converting to PaaS.

### ACHIEVE Microsoft WAF

Through the previous challenges, you have been slowly led through a process for achieving an implementation of the Microsoft Well-Architected Framework. In this challenge, you will begin putting it all together. The process of achieving a solid WAF implementation can be remembered by using the word _ACHIEVE_ as an acronym.

With this OpenHack, and your future customer engagements, you are highly encouraged to remember this process and implement it to greatly improve your chance of a successful WAF delivery. It's essentially our version of the _Scientific Method_.

**Assess** - Assess the current workload. Document every component and its configuration. The greater detail you include, the better chance of success you will have.

**Consider** - Take time to review your assessment and each component you've identified. As you move through each component in your list, consider how each pillar of WAF affects that component _and_ how that component may affect each pillar.

**Hypothesize** - As you consider each component under the lenses of the WAF pillars, propose new ideas on how to improve that component. There may be ways to greatly improve it (e.g. converting from IaaS to PaaS), or one could make improvements through small changes (e.g. adding a single RBAC policy, caching data). Regardless of its size, every improvement matters and can be exponentially significant for large customer workloads. These propositions will serve as your starting point for further investigation.

**ImprovE** - Now that you have some theories for improvements, it's time to take action. Based on your hypotheses, begin introducing improvements to the Azure environment. But, don't make drastic improvements all at once. Instead, gradually introduce changes so that you can adequately test how those changes impacted&mdash;positively or negatively&mdash;the Azure workloads.

**ValidatE** - After attempting some improvements, you should validate the results. Did the changes, in fact, improve the customer's workload? You should also understand that changes may not always improve the environment across _all_ pillars. For example, you may need to increase the size or number of App Service instances to support a workload or increase the size of Azure SQL. These changes may improve performance or resiliency, but can increase costs. Keep in mind, however, that the goal of WAF is not necessarily to _reduce_ costs, but rather to _optimize_ costs. We want to ensure that the customer is not simply wasting money, but spending money that will generate the best returns (ROI). The important thing to always consider is weighing the outcomes of your changes against every pillar and allowing the customer to determine their priority (e.g. cost vs. performance, in the case of the example).

Hopefully, your changes have improved the environment. If not, revert back. However, keep moving through your list and, when you have finished, start over. Technology changes and, with it, so does the opportunity to improve. What was the best resource a few months ago may now have a better alternative. Remember, the Microsoft Well-Architected Framework provides a set of guardrails to keep you on track, but the trip is never over.

## Customer requirements

Unfortunately, this is a scenario where the customer "doesn't know what they don't know." Woodgrove Bank has very little in terms of concrete requirements. However, as they become more familiar with the Microsoft Well-Architected Framework, they are seeking answers to the following questions in order to improve on their understanding:

* Did we choose the right virtual machines and configure them correctly?
* Is our cloud environment, including the Azure tenant, all application components and underlying hardware, tightly secured?
* How can we improve our visibility of the application's inner-workings?
* Is there a way to add alerts when the application ceases to respond?
* How can we improve the application's reliability and performance?
* How can we minimize our costs?

## Cheat sheet

There are not many "helpful hints" for this challenge. You must begin to truly scrutinize the configuration of Woodgrove Bank's environment and apply the principles of the Microsoft Well-Architected Framework. There are no shortcuts to WAF. You must successfully apply your knowledge of Azure and WAF to deliver an IaaS implementation that is optimized, secure, reliable and performant.

* In order for Application Insights to collect performance counters on the virtual machine, the IIS App Pool under which the application is running, must be added to the `Performance Monitor Users` group on each VM. \[[See the Stack Overflow link under references.](#references)\]

## Success criteria

As you work through this challenge, examine _every_ component you inventoried in _Challenge 1_ and ask yourself how each pillar affects that component. Through the lens of each pillar, can that component be improved in any way?

You will need to implement as many improvements as possible (with the exception of moving the application to PaaS). However, some improvements may not be possible given that this challenge is in a sandbox subscription. For such improvements, you will need to identify and discuss them with your coach.

For success in this challenge, you will need to perform the following:

* Again, with the exception of transitioning from IaaS to PaaS, your solution must address the following questions:
    * In what ways can I possibly improve costs?
    * How can I improve management of operations?
    * What ways can I improve performance?
    * How can I increase reliability?
    * Is this environment fully secure?
* Application Insights must be incorporated into the application.
* A dashboard will need to be added to Grafana for monitoring the application components.
* Identify and add any necessary alerts for application events.
* All areas of the Azure environment and the application will need to be secured. You must address areas within the portal itself, along with the infrastructure and the application.
(HINT: This may require you to update the build/release pipelines of the application in Azure DevOps.)
* All traffic from the customer to the application must be secure.  
(HINT: This includes more than just SSL certificates.)
* Any changes to the infrastructure must be accomplished via the Azure Bicep/ARM templates.
* Any changes must be validated as not decreasing application performance. You will need to re-run your performance tests to ensure that your changes do _not_ degrade performance. You've already established your baseline; you must continue to improve upon it.
* Ensure any new components are configured to send logs to Log Analytics and that the logs are maintained for 7 years.
* Update previous Grafana dashboards with telemetry from new components.
* Accurately describe the ACHIEVE process and its benefits.
* Discuss with your coach any other improvements that you could potentially implement.

Remember, **NOW** is the time for you to practice the _ACHIEVE_ method ([see above](#achieve-microsoft-waf)).

## References

* <a href="https://stackoverflow.com/questions/44124901/application-insight-monitor-doesnt-send-data-to-portal-due-to-insufficient-perm" target="_blank">Application Insights permissions</a>

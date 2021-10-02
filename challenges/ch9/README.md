# Capturing correlation data

Time Length: **1-2 hours**

## Reminders

* Use an InPrivate/Incognito window in your browser to avoid any confusion with any other credentials that you may use to access Azure resources.
* The credentials you need to access the Azure subscription assigned to your team are available on the _OpenHack Environment_ tab.

## Challenge

Throughout this engagement with Woodgrove Bank, your team has successfully re-architected an application under the guidelines of the Microsoft Azure Well-Architected Framework. Being as such, the application's components have now been distributed across multiple services due to decoupling. Unfortunately, this can make determining application failures a little challenging.

In this challenge, you will _discuss_ how to implement a strategy for capturing correlation data. Because the application's components reside across multiple services, your proposed strategy must enable Woodgrove Bank's SREs and developers to follow an application failure (error) throughout the _entire request pipeline_. All telemetry for the failed request must be captured, logged, and queryable.

## Customer requirements

Woodgrove Bank's development team is wishing to understand some best-practices for capturing errors across the various service layers. This should include some of the following concepts.

* Identifying all components and correlating the life-cycle events of a single request.
* What necessary data should be captured for troubleshooting.
* How/where the data will be stored and queried. This must also take into account privacy and personal identifiable information (PII).
* An approach to validating issues, capturing them in a backlog, and testing the success or failure of mitigation.

There is nothing to _implement_ in this challenge, but you will need to present your ideas to your coach and be prepared to discuss pros and cons of your suggested approach.

## Cheat sheet

There are many ways to accomplish this&mdash;some better than others. Take a look at the references below and determine which approach is best.

## Success criteria

You must consider the customer's requirements above and present to your coach how you believe each requirement should be met. There may be other factors to consider. Your approach should cover some of these other potential factors and the pros and cons of your various approaches.

## Success tips

* Make sure you read the included references. They can help tremendously with determining a solid strategy.
* Ensure you store the right amount of data. Too little data provides very little insight for bug remediation; too much data can slow down application performance and increase costs. Find the right mix.
* Make sure you are not storing any type of PII. Your strategy, however, will need to include a way to correlate captured issues with the user(s) who experienced them.
* Determine how you will ensure that the same bug isn't encountered in a future regression.

## References

* <a href="https://docs.microsoft.com/azure/azure-monitor/app/asp-net-exceptions" target="_blank">Diagnose exceptions in web apps with Application Insights</a>
* <a href="https://docs.microsoft.com/en-us/dotnet/core/diagnostics/distributed-tracing" target="_blank">.NET distributed tracing</a>
* <a href="https://docs.microsoft.com/aspnet/web-api/overview/testing-and-debugging/tracing-in-aspnet-web-api" target="_blank">Tracing in ASP.NET Web API 2</a>
* <a href="https://medium.com/@scokmen/debugging-microservices-part-ii-the-correlation-identifier-552f9016afcd" target="_blank">Debugging Microservices</a>
* <a href="https://opentracing.io/" target="_blank">The OpenTracing project</a>
* <a href="https://github.com/yurishkuro/opentracing-tutorial/tree/master/csharp" target="_blank">OpenTracing Tutorial - C# (GitHub)</a>
* <a href="https://opentelemetry.io/" target="_blank">OpenTelemetry</a>
* <a href="https://github.com/Azure-Samples/application-insights-aspnet-sample-opentelemetry" target="_blank">Application Insights integration with OpenTelemetry (GitHub)</a>
* <a href="https://docs.microsoft.com/azure/devops/test/?view=azure-devops" target="_blank">Azure Test Plans</a>

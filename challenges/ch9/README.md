# Capturing correlation data

Time Length: **1-2 hours**

## Reminders

* Use an InPrivate/Incognito window in your browser to avoid any confusion with any other credentials that you may use to access Azure resources.
* The credentials you need to access the Azure subscription assigned to your team are available on the _OpenHack Environment_ tab.

## Challenge

Throughout this engagement with Woodgrove Bank, your team has successfully re-architected an application under the guidelines of the Microsoft Azure Well-Architected Framework. Being as such, the application's components have now been distributed across multiple services due to decoupling. Unfortunately, this can make determining application failures a little challenging.

In this challenge, you will _discuss_ how to implement a strategy for capturing correlation data. Because the application's components reside across multiple services, your proposed strategy must enable Woodgrove Bank's SREs and developers to follow an application failure (error) throughout the _entire request pipeline_. All telemetry for the failed request must be captured, logged, and queryable.

## Customer requirements

## Cheat sheet

## Success criteria

## References

* <a href="https://docs.microsoft.com/azure/azure-monitor/app/asp-net-exceptions" target="_blank">Diagnose exceptions in web apps with Application Insights</a>
* <a href="https://docs.microsoft.com/en-us/dotnet/core/diagnostics/distributed-tracing" target="_blank">.NET distributed tracing</a>
* <a href="https://docs.microsoft.com/aspnet/web-api/overview/testing-and-debugging/tracing-in-aspnet-web-api" target="_blank">Tracing in ASP.NET Web API 2</a>
* <a href="https://medium.com/@scokmen/debugging-microservices-part-ii-the-correlation-identifier-552f9016afcd" target="_blank">Debugging Microservices</a>
* <a href="https://opentracing.io/" target="_blank">The OpenTracing project</a>
* <a href="https://github.com/yurishkuro/opentracing-tutorial/tree/master/csharp" target="_blank">OpenTracing Tutorial - C# (GitHub)</a>
* <a href="https://opentelemetry.io/" target="_blank">OpenTelemetry</a>
* <a href="https://github.com/Azure-Samples/application-insights-aspnet-sample-opentelemetry" target="_blank">Application Insights integration with OpenTelemetry (GitHub)</a>

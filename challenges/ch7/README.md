# Optimizing the API

Time Length: **2-3 hours**

## Reminders

* Use an InPrivate/Incognito window in your browser to avoid any confusion with any other credentials that you may use to access Azure resources.
* The credentials you need to access the Azure subscription assigned to your team are available on the _OpenHack Environment_ tab.

## Challenge

With the migration of the web application and some of its infrastructure to PaaS services, Woodgrove Bank's IT and development teams are excited about the future possibilities of their applications. They are already looking into additional use-cases. One item that has piqued their interest in particular is serverless. This has led team to wonder if, given the current "minimal" state of the web application, now would be an ideal time to refactor the API for a serverless architecture.

This challenge requires you to refactor the existing Web API backend for a serverless architecture and update the necessary components to leverage the newly-created functions. While the _coding_ requirements for this challenge should be fairly straight-forward and accomplishable with relatively little effort, you should remember all of the additional components that must be updated in order to succeed.

## Customer requirements

As continuously stated, all changes must be conducted via Azure Bicep and result in minimal, if any, downtime.

* The development team requires that the Web API application be refactored and moved to a serverless environment.
* The IT and development teams require that all infrastructure and code pipelines in Azure DevOps be updated to deploy and leverage the new/updated infrastructure.
* The IT and operations teams want to ensure that the resulting architecture will not compromise availability or performance. The final architecture should be designed in such a way that, if the front end becomes inoperable at any time, the backend still remains functional and vice versa. This will allow Woodgrove Bank to leverage the APIs for possible future components, such as mobile applications.
* The security team needs assurance that the API remains fully protected from outside intrusion along with all secure configuration components remaining in the Azure Key Vault previously deployed.
* The operations team must be able to continue to monitor the application through its operational dashboards.

## Cheat sheet

* As you may have identified, there are only five controllers in the Web API application. Additionally, each controller only has a single endpoint that conducts a query. Consider how you will organize these endpoints in your resulting serverless solution.
* You should identify the additional components that the API currently leverages, along with the components that leverage the API. In other words, what are the API's dependencies? What components have the API as a dependency? You will need to ensure that all items are updated, as necessary, in order to complete this challenge.
* If you elect to leverage Azure Functions, it may be beneficial to leverage the <a href="https://docs.microsoft.com/azure/azure-functions/functions-run-local" target="_blank">Azure Core Tools</a> for creating a new Azure Functions application. Alternatively, you can use solution plugins for Visual Studio or Visual Studio Code (see _References_ below).

## Success criteria

The success criteria is fairly simple.

* The backend application should be moved to a serverless architecture.
* The front end must be able to communicate with the backend.
* The front end and backend must be separated in a way that, should the front end application fail, the backend remains operational and vice versa. Additionally, the two environments should be able to scale independently.
* The resulting performance should be maintained or improved.
* The operational dashboards should be updated to report the metrics of the new architecture.
* Azure DevOps pipelines should be updated to deploy the newly refactored application and its supporting architecture.
* The new API endpoints should remain secure from outside intrusion.

## References

* <a href="https://docs.microsoft.com/azure/azure-functions/functions-run-local" target="_blank">Work with Azure Functions Core Tools</a>
* <a href="https://docs.microsoft.com/azure/azure-functions/functions-develop-vs-code?tabs=csharp" target="_blank">Develop Azure Functions by using Visual Studio Code</a>
* <a href="https://docs.microsoft.com/azure/azure-functions/functions-develop-vs" target="_blank">Develop Azure Functions using Visual Studio</a>
* <a href="https://markheath.net/post/azure-functions-bicep" target="_blank">Deploying an Azure Functions App with Bicep</a>

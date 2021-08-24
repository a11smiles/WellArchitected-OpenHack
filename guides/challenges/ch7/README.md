# Guide: Optimizing the API

## Success Criteria

## Hints/Suggestions

When moving the WebAPI to Azure Functions, the following will need to be accomplished (not necessarily in this order, but in totality):

* Update Bicep definitions to deploy an Azure Functions application to each region (typically, a separate application service should be used for the frontend and the backend)
* Moving the API endpoints to Azure Functions. It may be helpful to:
    * Create a single function app per region
    * Within the function app, create a single function per API endpoint
* Update Application Gateway to load balance and protect (via WAF) the Azure Functions apps
* Configure the Azure Functions to scale, as appropriate
* Configure Application Insights to monitor the Azure Functions apps
* Update the `appsettings` of the _frontend_ website to call the correct URL for the API
* Update the Azure DevOps pipelines to push API changes to the Azure Function apps
* Ensure that the Azure Functions apps can query the Azure Key Vault instance to get the Azure SQL connection string
* Ensure the Azure Functions apps can connect to the Azure SQL Database via a private endpoint
* Update the Grafana dashboards to report operational metrics for the Azure Functions app
* Make sure that CORS is configured correctly on the Azure Functions application

## References

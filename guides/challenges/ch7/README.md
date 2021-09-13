# Guide: Optimizing the API

## Success Criteria

As stated in the participants guide, this should be a fairly straightforward exercise. The participants will need to move the API to a serverless solutions. Within Azure, the best approach will be to use Azure Functions. The _Hints/Suggestions_ below simply reiterate the success criteria for this challenge, but, in some cases, in slightly more detail.

* The current Web API solution will need to be refactored as an Azure Function.
* An Azure Function, along with its App Service, should be instantiated in Azure using Azure Bicep (or alternative IaC solution).
* The App Service for Azure Functions should be a _separate_ App Service than that which is currently used by the front end.
* The refactored Web API will need to be built and deployed from Azure DevOps to the new Azure Function instance.
* Autoscaling will need to be configured for the Azure Function.
* All secrets will need to be stored and read from the Azure Key Vault instance.
* Application Insights will need to be added to the Azure Functions.
* Operational dashboards should be updated to report the functionality of the Azure Functions.
* The Azure Function endpoints should be secured.

## Hints/Suggestions

When moving the Web API to Azure Functions, the following will need to be accomplished (not necessarily in this order, but in totality):

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
* The Azure Functions endpoints should be placed behind APIM

## References

_None specific to coaches._

## Step-By-Step

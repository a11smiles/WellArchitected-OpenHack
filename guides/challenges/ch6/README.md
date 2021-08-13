# Guide: Leveraging PaaS services

## Success Criteria

There is quite a bit that the team can accomplish when updating Woodgrove Bank's infrastructure from IaaS to PaaS. Based on the intended business outcomes of this challenge, the following should be accomplished at a minimum:

* All changes should be implemented via the Azure Bicep/ARM Templates. The application, supporting services, and database can be moved to Azure PaaS services, as necessary.
* The ACHIEVE method should be adequately practiced by the team so that all components of Woodgrove Bank's infrastructure are identified.
* The team should be prepared to discuss budgeting for Azure PaaS services.
* The team should configure and demonstrate Blue-Green deployments using Azure Traffic Manager.
* The Azure App Services should be configured to scale up **AND** down and with minimum instances. The team should be able to effectively communicate their reasoning for their configuration choices.
* The Azure App Service configurations are not updated manually, but through via Azure DevOps pipelines.
* The Azure App Service configurations are referencing secure secrets (e.g. SQL connection string) from the Azure Key Vault. Azure DevOps should no longer be _injecting_ connection strings during the Release Pipelines.
* The Azure App Services should leverage TLS 1.2.
* The Azure App Services should have FTP/FTPS access disabled.
* The Azure App Services for the API should only allow CORS requests from the public DNS of the web application.
* The Azure App Services are configured for BCDR and high-availability.
* Azure SQL is configured with automatic failover in Woodgrove Bank's secondary region.
* Azure SQL is configured for SQL Always Encrypted.
* In-transit data is secured by Azure private endpoints between the App Services, Azure Batch and Azure SQL.
* Azure Batch is configured for processing the background jobs in parallel. (see [suggestions](#hintssuggestions) below)
* Performance has been maintained or improved.
* Alerting has been updated.
* Application should maintain uptime when "chaos" script is executed.
* Reporting has been added and/or updated for PaaS services on the Grafana dashboards.

## Hints/Suggestions

* Web applications will need additional configuration settings to ensure that DNS lookups at the App Service resolve private IP addresses for Azure SQL. You will need to verify that the configuration on the App Services is set according to the <a href="https://docs.microsoft.com/azure/architecture/example-scenario/private-web-app/private-web-app#dns-zone-configuration" target="_blank">documentation</a>.
* While it is possible, given the nature of the current background process, to configure it as a WebJob, the recommended approach will be using Azure Batch. While the batch process is only generating a handful of transactions, the idea is that such a background job may need to process _millions_ of transactions in a real-world application. Therefore, the goal is to familiarize participants with Azure Batch beyond the normal media processing scenarios, and participants should have experience in configuring Azure Batch for scale.
* Instead of scripting Azure Batch jobs, teams can leverage the Application Packages functionality of Azure Batch. In this case, participants will need to create an Archive package (.zip file) in the Azure DevOps pipelines and deploy the package to Azure Batch.
* The team may wish to use the `az batch application` CLI commands for deploying application packages.

## References

* <a href="https://azure.microsoft.com/blog/blue-green-deployments-using-azure-traffic-manager/" target="_blank">Blue-Green deployments using Azure Traffic Manager</a>
* <a href="https://docs.microsoft.com/azure/app-service/app-service-key-vault-references#reference-syntax" target="_blank">Referencing Azure Key Vault from Azure App Service configuration</a>
* <a href="https://docs.microsoft.com/azure/architecture/example-scenario/private-web-app/private-web-app" target="_blank">Web app private connectivity to Azure SQL</a>
* <a href="https://docs.microsoft.com/azure/azure-sql/database/auto-failover-group-overview" target="_blank">Azure SQL auto-failover groups</a>
* <a href="https://docs.microsoft.com/cli/azure/batch/application?view=azure-cli-latest" target="_blank">az batch application</a>
* <a href="https://docs.microsoft.com/azure/batch/batch-ci-cd" target="_blank">Azure DevOps for deploying HPC solutions</a>  
  (**NOTE:** This isn't necessarily the solution that participants will want to follow, but it may provide some additional concepts for them to consider.)

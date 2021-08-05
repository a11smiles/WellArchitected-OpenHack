# Guide: Operationalize automated deployments

## Success Criteria
* The ARM deployments should be executed in _complete_ mode (versus _incremental_ mode) so that resources not specified in the ARM template will be destroyed.
* The attendees will need to build _at least_ three separate build and release pipelines&mdash;a separate build and release pipeline for each project. They will need to demonstrate that each build and release pipeline is functional.
* All three release pipelines should have an approval gate that requires human approval prior to a build being published to production. Attendees must demonstrate the operating approval gate.
* The team must configure a _pre-deployment_ step in the release pipeline that, using a `what-if` flag, reports the potential changes to the environment prior to them being implemented. Only if the fictitious Woodgrove Bank IT team confirms the changes in the pre-deployment step will they approve the push to production.
* Parameters in the Azure Bicep scripts must be annotated with `@allowed` and the arrays must contain a set of "allowable" SKUs. It isn't important _which_ SKUs the team chooses. The requirement is that the team demonstrates _how_ to accomplish this.
* Attendees must explore various deployment strategies so that the application remains completely operational while being deployed. The team isn't required to configure the strategy in this challenge. They should, however, be aware of the various strategies and discuss the benefits and drawbacks of each.
* The team should be prepared to present their chosen deployment strategy and explain why they chose that strategy compared to others.

## Hints/Suggestions
* Unless someone of the team has had previous experience with Azure Bicep, it may prove to be the most difficult aspect of this challenge. It may be helpful if the team pauses to explore the capabilities and usage of Azure Bicep.
* This challenge should engage both developers and infrastructure architects as it requires a mixture of DevOps and ARM. If the team appears overwhelmed, encourage the team to split up and prioritize the requirements so that they can work in parallel.

## References
* <a href="https://docs.microsoft.com/azure/azure-resource-manager/templates/deployment-modes" target="_blank">ARM deployment modes</a>
* <a href="https://docs.microsoft.com/azure/azure-resource-manager/templates/bicep-tutorial-add-parameters?tabs=azure-powershell#customize-by-environment" target="_blank">Using `@allowed` in Azure Bicep parameters
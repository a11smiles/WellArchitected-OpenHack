# Tightening database security

Time Length: **1 hour**

## Reminders

* Use an InPrivate/Incognito window in your browser to avoid any confusion with any other credentials that you may use to access Azure resources.
* The credentials you need to access the Azure subscription assigned to your team are available on the _OpenHack Environment_ tab.

## Challenge

Woodgrove Bank continues to see improvements with their application and its underlying infrastructure. Your team has helped train and empower them to deploy solutions that are very well architected. However, there are still additional improvements that can be made.

In terms of security, the backend, like traditional applications, is still connecting the database using a SQL identity. According to the Microsoft Azure Well-Architected Framework, the best policy is for applications to connect to SQL using a _service principal_. Additionally, data should always be encrypted, whether in transit or at rest.

In this challenge, you will accomplish both of the above tasks to tighten security. You will need to ensure that the data is encrypted and that the application is using a managed principle for connectivity.

## Customer requirements

The SecOps and NetOps teams have the following requirements.

* All connectivity between applications and databases should be conducted with a managed principal, _not_ a named account.
* All data in transit and at rest should be encrypted. The SecOps team and database administrators have identified the following tables/columns that require encryption:
    * Table `[Users]`: All columns
    * Table `[Accounts]`: All columns
    * Table `[Transactions]`: `[AccountId]` column

## Cheat sheet

* You will need to create an AD user to act as the database administrator. You'll then need to add that user as the Administrator of the database before you can add managed principals to the database for authentication.
* Secure enclaves are ideal, but not required to pass this challenge.
* You may use the previously configured Azure Key Vault or a new, separate Key Vault for maintaining the encryption keys.
* Microsoft provides an `AzureKeyVaultProvider` out of the box (third reference below). There is no need to create a custom one, but a reference is provided for visibility (fifth reference below).

## Success criteria

The success criteria consists of the following two requirements:

* The application must connect to the database using a managed principal.
* The appropriate tables and columns should be encrypted per Woodgrove Bank's requirements.

## References

* <a href="https://docs.microsoft.com/azure/azure-sql/database/authentication-aad-service-principal" target="_blank">Azure Active Directory service principal with Azure SQL</a>
* <a href="https://docs.microsoft.com/azure/app-service/app-service-web-tutorial-connect-msi?tabs=windowsclient%2Cdotnet" target="_blank">Tutorial: Secure Azure SQL Database connection from App Service using a managed identity</a>
* <a href="https://docs.microsoft.com/azure/azure-sql/database/always-encrypted-azure-key-vault-configure?tabs=azure-powershell" target="_blank">Configure Always Encrypted by using Azure Key Vault</a>
* <a href="https://docs.microsoft.com/sql/connect/ado-net/sql/sqlclient-support-always-encrypted?view=sql-server-ver15" target="_blank">Using Always Encrypted with the Microsoft .NET Data Provider for SQL Server</a>
* <a href="https://docs.microsoft.com/sql/connect/ado-net/sql/azure-key-vault-example?view=sql-server-ver15" target="_blank">Example demonstrating use of Azure Key Vault provider with Always Encrypted</a>

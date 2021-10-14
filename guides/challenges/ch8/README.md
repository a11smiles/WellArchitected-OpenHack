# Guide: Tightening database security

## Success Criteria

Like the previous challenge, this one should be clear in the objectives and its criteria for success. The participants will need to ensure the following for passing this challenge:

* The requested database tables and columns should be encrypted.
* The application is connecting to the database in such a way that allows the encrypted data to be read.
* The application is connecting to the database using a managed principal.

## Hints/Suggestions

* Besides encrypting the database tables and columns, the application should connect to the database by performing _one_ of the following:
    * the connection string of the application should include the following keyword:

    ```csharp
    Column Encryption Setting=Enabled;
    ```

    * using the `SqlConnectionStringBuilder`, the connection string encryption should be set via a property:

    ```csharp
    // Instantiate a SqlConnectionStringBuilder.
    SqlConnectionStringBuilder connStringBuilder = new SqlConnectionStringBuilder("replace with your connection string");

    // Enable Always Encrypted.
    connStringBuilder.ColumnEncryptionSetting = SqlConnectionColumnEncryptionSetting.Enabled;
    ```

## References

_None specific to coaches._

## Step-By-Step

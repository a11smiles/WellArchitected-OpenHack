using System;
using CommandLine;
using Microsoft.VisualStudio.Services.Common;


namespace Deploy
{
    class Program
    {
        static void Main(string[] args)
        {
            VssCredentials creds = null;
            string collectionUrl = string.Empty;
            string path = string.Empty;

            Parser.Default.ParseArguments<Options>(args)
                .WithParsed<Options>(o =>
                {
                    if (String.IsNullOrWhiteSpace(o.AccessToken))
                    {
                        creds = new VssCredentials();
                    }
                    else
                    {
                        creds = new VssBasicCredential(string.Empty, o.AccessToken);
                    }

                    collectionUrl = "https://dev.azure.com/" + o.Organization;
                    path = o.Source;
                });

            var ado = new AdoHelper(creds, collectionUrl);

            // Create Bicep project
            /*
             * - 1. Create Project
             * - 2. Create _bicep_ repo
             * 3. Create commit, checkin files
            */
            var bicepProject = ado.CreateProject("Bicep");
            var bicepTempRepo = ado.CreateRepository(bicepProject, "temp", true);
            ado.RemoveRepository(bicepProject, "Bicep", isDefault: true);
            var bicepRepo = ado.CreateRepository(bicepProject, "bicep");
            ado.CommitRepository(bicepProject, bicepRepo, path);
            ado.RemoveRepository(bicepProject, "temp", isTemp: true);

            // Create Portal project
            /*
             * - 1. Create Project
             * - 2. Create _web_ repo
             * 3. Create commit, checkin files
             * - 4. Create _processor_ repo
             * 5. Create commit, checkin files
            */
            /*
            var portalProject = ado.CreateProject("Portal");
            ado.RemoveDefaultRepository(portalProject, "Portal");

            var processorRepo = ado.CreateRepository(portalProject, "processor");

            var webRepo = ado.CreateRepository(portalProject, "web");
            */
        }
    }
}

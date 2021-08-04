using System;
using CommandLine;
using Microsoft.VisualStudio.Services.Common;
using Microsoft.VisualStudio.Services.Client;
using Microsoft.TeamFoundation.SourceControl.WebApi;
using Microsoft.VisualStudio.Services.WebApi;

namespace Deploy
{
    class Program
    {
        static void Main(string[] args)
        {
            VssCredentials creds = null;

            Parser.Default.ParseArguments<Options>(args)
                .WithParsed<Options>(o => 
                {
                    if (String.IsNullOrWhiteSpace(o.AccessToken))
                    {
                        creds = new VssCredentials();
                    } else {
                        creds = new VssBasicCredential(string.Empty, o.AccessToken);
                    }
                });

            Console.WriteLine(creds);
        }
    }
}

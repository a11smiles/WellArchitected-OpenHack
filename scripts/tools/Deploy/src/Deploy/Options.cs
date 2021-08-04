using CommandLine;

namespace Deploy
{
    public class Options
    {
        [Option('p', "pat", HelpText = "A personal access token.")]
        public string AccessToken { get; set; }

        [Option('o', "org", HelpText = "The name of the Azure DevOps organization.")]
        public string Organization { get; set; }
    }

}
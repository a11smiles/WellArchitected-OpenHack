using CommandLine;

namespace Deploy
{
    public class Options
    {
        [Option('p', "pat", HelpText = "A personal access token.")]
        public string AccessToken { get; set; }

        [Option('o', "org", HelpText = "The name of the Azure DevOps organization.")]
        public string Organization { get; set; }

        [Option('s', "source", HelpText = "The path of the source folder.")]
        public string Source { get; set; }
    }

}
// is7ty5ebjg3culktqszwwmtipmgslb3binacvqwqf3qnx7dv5qiq
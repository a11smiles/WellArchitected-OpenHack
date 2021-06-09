# Well-Architected Framework OpenHack

This project is the home of the OpenHack experience for the Well-Architected Framework. All training material which includes, but is not limited to, challenges, diagrams, coaching assistance, and environment materials (e.g. ARM templates, source code, etc.) will be kept in this repository. The exception to this rule will be the tools that participants will be trained upon and can use in customer engagements for conducting assessments. Those tools will be stored in the _public_ repo [Azure/WellArchitected-Tools](https://github.com/Azure/WellArchitected-Tools).

## Documentation
1. [Build of Materials](docs/bom.md)
2. [OpenHack Overview](docs/overview.md)
3. [Challenge Outline](docs/outline.md)
4. Challenges  
   - [Overview](challenges/ch0)  
   - [Challenge 1: Assess the environment](challenges/ch1)  
   - [Challenge 2: Operationalize automated deployments](challenges/ch2)  
   - [Challenge 3: Planning for failure](challenges/ch3)  
<!--   - [Challenge 4: Visualizing operations](challenges/ch4)  
   - [Challenge 5: Improve the environment](challenges/ch5)  
   - [Challenge 6: Leveraging PaaS services](challenges/ch6)
   - [Challenge 7: Optimizing the API](challenges/ch7)
   - [Challenge 8: Tightening database security](challenges/ch8)
   - [Challenge 9: Capturing correlation data](challenges/ch9) -->
5. Automation/Build Scripts
6. Coach's Deck
7. Coach's Guides
   - [Challenge 1: Assess the environment](guides/challenges/ch1)  
   - [Challenge 2: Operationalize automated deployments](guides/challenges/ch2)
   - [Challenge 3: Planning for failure](guides/challenges/ch3)  
<!--   - [Challenge 4: Visualizing operations](guides/challenges/ch4)  
   - [Challenge 5: Improve the environment](guides/challenges/ch5)  
   - [Challenge 6: Leveraging PaaS services](guides/challenges/ch6)
   - [Challenge 7: Optimizing the API](guides/challenges/ch7)
   - [Challenge 8: Tightening database security](guides/challenges/ch8)
   - [Challenge 9: Capturing correlation data](guides/challenges/ch9) -->
8. [Success Matrix](guides/successMatrix.xlsx) (Excel)
9. Tech Lead's Deck

## Directory Structure
```
.
├── assets                      (any assets that are "global" to the OpenHack, e.g. Visio diagrams)
├── challenges                  (OpenHack challenge content; this folder structure is the same for //guides content)
│   └── chX
│       ├── assets              (folder for any additional assets...if necessary)
│       ├── images              (image folder for specific challenge)
│       └── README.md           (content for specific challenge)
├── docs                        (project documentation)
├── guides                      (guides and PPT decks for coaches and tech leads)
└── scripts                     (scripts for building out the OpenHack tenant)
```

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.

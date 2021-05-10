# Overview

During this OpenHack you will be tested on your understanding of the Microsoft Well-Architected Framework. You will demonstrate and practice a standardized process of conducting a Well-Architected assessment across all five of its pillars against a customer's workload.

Any resemblance to actual scenarios, issues, or pain points that you are currently facing with customers is _not_ coincidental. The definitions of the challenges that will be presented to you during this event are inspired by real cases.

## Context
Woodgrove Bank

## Architecture


## Cheat sheet
In this section, you will find a list of hints to help you through the Well-Architected Framework OpenHack.

### Obtaining the credentials of your team environment

1. Navigate to the **OPEN HACK ENVIRONMENT** tab.
2. The usernames and passwords provided can be used to access your OpenHack's Azure subscription.

### Connecting to the public-facing application

1. Open the [Azure portal](https://portal.azure.com).
2. Use a username/password combination found in your **OPEN HACK ENVIRONMENT** tab to login.
3. Search for the resource **elb-eastus**. This is your external load balancer. The FQDN of the load balancer can be used to access the web application in the OpenHack. The FQDN will be formatted as **elb-eastus-\[unique string\].eastus.azure.com**. For example:

    - **teome**
### Logging in to the web application

You can login to a fictitious customer's bank account using the following credentials:

| User | Acct No. | Username | Password |
| ---- | -------- | -------- | -------- |
| Daniel Melamed | 686847363244 | dmelamed3244 | (Pass@word)1234! |
| Ting Niu       | 815571025629 | tniu5629     | (Pass@word)5678! |

### Connecting to the servers

1. Open the [Azure portal](https://portal.azure.com).
2. Use a username/password combination found in your **OPEN HACK ENVIRONMENT** tab to login.
3. Search for the VMs using the term **vm-eastus**. The VMs will be named using the format listed above. 
4. Use a Remote Desktop Connection (RDP) to connect to the server you choose by using its Public IP address.

### Logging in to the database

You can use SSMS on the database server itself, or you may use a local copy of SSMS for connecting to the application's database.

The database credentials are the following:

| Username | Password | Description |
| -------- | -------- | ----------- |
| sa       | (Pass@word)1234! | System Administrator |
| webapp   | S0m3R@ndomW0rd$  | Account used by web application |


## References
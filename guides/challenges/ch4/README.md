# Guide: Visualizing operations

## Success Criteria

* The team should design a set of dashboards for presenting operational data. Additionally, the team should be able to effectively communicate _why_ they designed and organized the dashboards the way that they did.
* A Grafana instance should be configured. The team can use their own Grafana instance should they choose, but the free version at Grafana Cloud is simple and quick to deploy.
* The Grafana instance should be able to successfully query Log Analytics and Azure Monitor.
* The dashboards should auto-fresh at intervals no greater than 10 seconds.
* The team should successfully present an approach for storing and querying operational data from on-premises resources.
* Permissions need to be configured in Grafana to allow some users to edit dashboards and others to only view them.

## Hints/Suggestions

* In order for different dashboards to automatically cycle through, the team will need to create what's called a "stack" (or folder) of the dashboards in Grafana.
* The approach for storing and querying on-premises operational data must use some type of time-series database (TSDB) where the records, when queried, are returned in ascending order by date/time stamp. This fact is one of the basic requirements of Grafana. Potential solutions could include SQL (any flavor, on-premises or Azure, but on-premises will need to be accessible via the public Internet); <a href="https://grafana.com/oss/loki/" target="_blank">Loki</a>, a log aggregation system developed by Grafana; or InfluxDB, a time-series database.

> NOTE: InfluxDB also has a free account, or a subscription can be established for an InfluxDB account via an Azure subscription.

* Grafana manages group permissions by creating "teams" and assigning appropriate permissions, and the respective users, to them.

## References

* <a href="https://www.influxdata.com/time-series-database/" target="_blank">Time series database (TSDB) explained</a>
* <a href="https://www.influxdata.com/products/influxdb-cloud/" target="_blank">InfluxDB Cloud</a>
* <a href="https://grafana.com/docs/grafana/latest/datasources/loki/" target="_blank">Using Loki in Grafana</a>

## Tech Guidance

> **NOTE:** As stated previously, the team can create a _free_ Grafana cloud account. However, should they choose, they can run a Grafana Docker image locally to complete this challenge.

1. There are a number of dashboard components that the team can create for monitoring the current environment. Below are a few ideas. Keep in mind that most of the below can be reported directly from Azure Monitor. Very few Kusto queries need to be written. Finally, the team isn't required to report on _everything_ as this could cost a lot of time. Instead, the goal is to help teams become familiar with collecting and reporting data _and_ the different ways data (graphs, bar charts, gauges, pie charts, etc.) can be reported.

2. The team should configure a few different dashboards based on some type of collection. This collection could be based on audience (IT, NetOps, App Dev, SQL Admins, etc.) or Azure Well-Architected Framework pillar. What "collection" they choose isn't important. However, they should configure the dashboards to automatically cycle through every 10 seconds.

3. The team should configure guest <a href="https://docs.microsoft.com/azure/azure-monitor/essentials/collect-custom-metrics-guestos-resource-manager-vm" target="_blank">diagnostic settings</a> for the virtual machines (along with enabling ASP.NET and SQL on the appropriate machines). This will allow them to configure custom performance counters, capture additional logs, and redirect (sink) diagnostic data to Azure Monitor.

> **NOTE:** At the moment, Application Insights has not been added to the machines (that will happen in _Challenge 5_). Therefore, the dashboards will be primarily infrastructure-related. However, once client diagnostics are enabled, "classic" guest metrics can return some primitive metrics based on guest processes (.NET, IIS, SQL Server).

### Load Balancer

1. Allocated vs. Used SNAT Ports
2. SNAT Connections
3. Byte Count
4. Health Probe Status

### .NET (Web Server/Application)

1. Current Connections
2. Bytes Total
3. Application Restarts
4. Applications Running
5. Requests Execution Time
6. Request Wait Time
7. Current Requests

### SQL Server

1. Connections
2. Batch Requests
3. Database Pages
4. Reads/Writes
5. Compilations/Re-Compilations

### Virtual Machines

1. Total Memory
2. Available Memory
3. Disk IOPs (various metrics like Read/Write/Queue/Cache, etc.)
4. CPU Percentage
5. Custom Performance Counters
6. Availability (heartbeat)
7. Security or critical updates
8. Failed logins

### Virtual Network

1. Failed Pings to VM
2. Round trip time for Pings to VM
3. DDoS statistics
4. Inbound/Outbound TCP/UDP bytes and/or packets

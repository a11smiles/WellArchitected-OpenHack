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

---
sidebar_position: 1
---

# Capacity Estimation

Before Moving to Design, It is good to further estimate the capacity on following ground:
1. Daily/Monthly Active Users (DAU/MAU)
2. Throughput: requests per second
3. Storage: Gb, Tb [for 10 years]
4. Network Bandwidth: Gbps

<hr/>

Capacity Estimation helps in the following:
1. Number of Server and Databases required.
2. Cost Management: Helps in Avoiding Over-provisioning and Under-provisioning.
3. Decide type and specifications of hardware:
Eg: Sql can handles 50K Queries/hr and No-Sql can handles 1M Queries/Hr
4. Helps Us in determining Read-Heavy and Write-Heavy Operations
Eg: For Read-Heavy Use- PostgresSql, and for Write-Heavy use CassandraDb

<hr />

## Definations:
1. Daily Active Users (DAU): Number of **unique** users active per day.
2. Monthly Active Users (MAU): Number of **unique** users active per month.

```
MAU != 4*DAU
```
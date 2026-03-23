---
sidebar_position: 2
---

# Capacity Estimation

Given: 
1. DAU = 100 M users
2. MAU = 400 M users

### A. Throughput [requests per unit of time]

Now you start thinking:

Throughput can be further divided into **write-throughput** and **read-throughput**.

So, Let's start with what all operations user can perform:
1. Retrieving search-results [Read Operation]
2. No Write-requests

#### A.1: Read-Throughput
Assume every user performs an average of <span style={{color: "red"}}>5 searchees per day</span>.
```math
Total Read operations per day = DAU * 5 = 100 M * 5 = 500 M read-request per day.
```

<!-- ### B. Storage [Bytes per unit of time]

The major storage will come from post becuase it will contain media.
Assume a post consists of the following media alone with % of users posting it daily.
| Media-type | Media-size(Mb) | % |
|------------|----------------|----------|
| Text       |<span style={{color: "red"}}>0.1</span>|<span style={{color: "red"}}>20</span>|
| Image      |<span style={{color: "red"}}>0.5</span>|<span style={{color: "red"}}>60</span>|
| Video      |<span style={{color: "red"}}>20</span> | <span style={{color: "red"}}>20</span>|

```math
Average Post-Size = 0.1 * 0.2 + 0.5 * 0.6 + 20*0.2 Mb = 4.32 Mb
Total Storage per day  = 10% of DAU * Average Post-Size
                        = 50M * 4.32 Mb
                        = 216 M Mb
                        = 216 Tb per day

Storage for 10 years = 216 Tb * 365 * 10
                     = 788400 Tb
                     = 788.4 Pb
```

### C. Cache-Memory
Cache Memory is generally 1% of total storage per day
```math
Cache-Memory = 1% of daily Storage = 0.01 * 216 Tb = 2.16Tb per day
``` -->

### B. Network Bandwidth
<!-- #### D.1: Ingress Traffic
Traffic coming **into** the system i.e. write traffic

```math
Ingress = Write per second
        = (Total Writing requests per second) * (Average Post size)
        = (50M / 24/ 60/ 60) *  (4.32 Mb)
        = (0.57 K/sec) * (4.32 Mb)
        = 2.5 Gbps
``` -->

#### B: Egress Traffic
Traffic going **out** of the system i.e. read traffic
Assume each search returns <span style={{color: "red"}}>10 tweets of 200 bytes on an average</span>.

```math

Egress = read per second
        = (Total read requests per second) * (Average Search size)
        = (500 M / 24/ 60/ 60) *  (10 * 200 Bytes)
        = (5.7 K/sec) * (2 Kb)
        = 11.57 Mbps
```


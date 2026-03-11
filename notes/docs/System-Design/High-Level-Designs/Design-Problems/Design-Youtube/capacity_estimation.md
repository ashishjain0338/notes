---
sidebar_position: 2
---

# Capacity Estimation

Assume: 
1. DAU = <span style={{color: "red"}}>100 M users</span>
2. MAU = <span style={{color: "red"}}>2.5 B users</span>

### A. Throughput [requests per unit of time]


Throughput can be further divided into **write-throughput** and **read-throughput**.

So, Let's start with what all operations user can perform:
1. Uploading Content [Write-Operation]
2. Sreaming Content [Read-Operation]

#### A.1: Read-Throughput
Assume every user sees an average of <span style={{color: "red"}}>10 videoes per day</span>.
```math
Total Read operations per day = DAU * 10 = 100 M * 10 = 1 B read-request per day.
```

#### A.2 Write-Throughput
Assume <span style={{color: "red"}}>0.4 of users</span> uploads content everyday.

```math
Total Write operations per day = 0.4% of DAU = 0.4 * 100M/100 = 0.4M write requests per day
```

### B. Storage [Bytes per unit of time]

Assume Average size of content is <span style={{color: "red"}}>600 Mb</span>. 

```math
Average Content-Size = 600 Mb
Total Storage per day  = Write-throughput * Average Content-Size
                        = 0.4M * 600 Mb
                        = 240 M Mb
                        = 240 Tb per day

Storage for 10 years = 240 Tb * 365 * 10
                     = 876000 Tb
                     = 876 Pb
```

### C. Cache-Memory
Cache Memory is generally 1% of total storage per day
```math
Cache-Memory = 1% of daily Storage = 0.01 * 240 Tb = 2.4Tb per day
```

### D. Network Bandwidth
#### D.1: Ingress Traffic
Traffic coming **into** the system i.e. write traffic

```math
Ingress = Write per second
        = (Total Writing requests per second) * (Average Content size)
        = (0.4M / 24/ 60/ 60) *  (600 Mb)
        = (4.6 requests/sec) * (600 Mb)
        = 2.7 Gbps
```

#### D.2: Egress Traffic
Traffic going **out** of the system i.e. read traffic

```math
Egress = read per second
        = (Total read requests per second) * (Average Content size)
        = (1B / 24/ 60/ 60) *  (600 Mb)
        = (11.57 K/sec) * (600 Mb)
        = 6.9 Tbps
```


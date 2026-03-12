---
sidebar_position: 2
---

# Capacity Estimation

Assume: 
1. DAU = <span style={{color: "red"}}>300 M users</span>
2. MAU = <span style={{color: "red"}}>1 B users</span>

### A. Throughput [requests per unit of time]


Throughput can be further divided into **write-throughput** and **read-throughput**.

So, Let's start with what all operations user can perform:
1. Creating Short-url from long-url [Write-Operation]
2. Fetching Long-url from short-url [Read-Operation]

#### A.1: Read-Throughput
Assume every user fetches long-url for <span style={{color: "red"}}>20 short-url per day</span>.
```math
Total Read operations per day = DAU * 20 = 300 M * 20 = 6 B read-request per day.
```

#### A.2 Write-Throughput
Assume <span style={{color: "red"}}> 10% of users</span> will create a 5-short-url everyday.

```math
Total Write operations per day = (10% of DAU) * 5 = (0.1 * 300M) * 5 = 150M write requests per day
```

### B. Storage [Bytes per unit of time]

Assume Average storage as = Size of Long-Url + Size of Short-Url + Metadata like timestamp = 100bytes + 30 bytes + 70 bytes = <span style={{color: "red"}}>200 bytes</span>. 

```math
Average Mapping-Size = 200 b
Total Storage per day  = Write-throughput * Average Content-Size
                        = 150M * 200 b
                        = 30 M Kb
                        = 30 Gb per day

Storage for 10 years = 30 Gb * 365 * 10
                     = 109500 Gb
                     = 0.1095 Pb
```

### C. Cache-Memory
Cache Memory is generally 1% of total storage per day
```math
Cache-Memory = 1% of daily Storage = 0.01 * 30 Gb = 3 Gb per day
```

### D. Network Bandwidth
#### D.1: Ingress Traffic
Traffic coming **into** the system i.e. write traffic

```math
Ingress = Write per second
        = (Total Writing requests per second) * (Average Entry size)
        = (150M / 24/ 60/ 60) *  (200 b)
        = (1.73 K requests/sec) * (200 b)
        = 346 Kbps
```

#### D.2: Egress Traffic
Traffic going **out** of the system i.e. read traffic

```math
Egress = read per second
        = (Total read requests per second) * (Average Entry Size)
        = (6B / 24/ 60/ 60) *  (200 b)
        = (6.44 K/sec) * (200 b)
        = 13.8 Mbps
```


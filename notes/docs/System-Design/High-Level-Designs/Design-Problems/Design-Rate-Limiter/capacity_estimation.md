---
sidebar_position: 2
---

# Capacity Estimation

Assume: 
1. DAU = <span style={{color: "red"}}>500 M users</span>
2. MAU = <span style={{color: "red"}}>2 B users</span>

### A. Throughput [requests per unit of time]


Throughput can be further divided into **write-throughput** and **read-throughput**.

So, Let's start with what all operations user can perform:
1. Updating Request on ascessing the rate-limiter [Write-Operation]
2. Ascessing the rate-limiter [Read-Operation]

#### A.1: Read-Throughput
Assume every user requests for <span style={{color: "red"}}>100 API-calls per day</span>.
```math
Total Read operations per day = DAU * 100 = 500 M * 100 = 50 B read-request per day.
```

#### A.2 Write-Throughput
Assume there are <span style={{color: "red"}}> 50 UNIQUE API's</span>. Then counters will be stored for each user per api.
```math
Total Write operations per day = DAU * 50 = 500 M * 50 = 25 B write requests per day
```

### B. Storage [Bytes per unit of time]

Assume Average storage as = UserId + API + Counter =  <span style={{color: "red"}}>100 bytes</span>, and assuming 50 unique api's. 

```math
Average Mapping-Size = 100 b
Total Storage per day  = Write-throughput * Average Mapping-Size
                        = 25 B * 100 b
                        = 2.5 B Kb
                        = 2.5 Tb per day

For Estimating storage for 10 years, we need to know, how many unique users will come in the span of 10 years. 
```

### C. Cache-Memory
Cache Memory is generally 1% of total storage per day
```math
Cache-Memory = 1% of daily Storage = 0.01 * 2.5 Tb = 25 Gb per day
```

### D. Network Bandwidth
#### D.1: Ingress Traffic
Traffic coming **into** the system i.e. write traffic

Assume the request-response data size is <span style={{color: "red"}}>1 Kb</span>.
```math
Ingress = Write per second
        = (Total Writing requests per second) * (Average Entry size)
        = (25 B / 24/ 60/ 60) *  (100 b)
        = (289.35 K requests/sec) * (100 b)
        = 28.9 Mbps
```

#### D.2: Egress Traffic
Traffic going **out** of the system i.e. read traffic

```math
Egress = read per second
        = (Total read requests per second) * (Average request-response Size)
        = (50B / 24/ 60/ 60) *  (1 Kb)
        = (578.7 K/sec) * (1 Kb)
        = 578.7 Mbps
```


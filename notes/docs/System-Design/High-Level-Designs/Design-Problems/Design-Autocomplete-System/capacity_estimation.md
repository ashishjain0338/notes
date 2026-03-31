---
sidebar_position: 2
---

# Capacity Estimation

Given: 
1. DAU = 10 M users
2. MAU = 40 M users

### A. Throughput [requests per unit of time]

Now you start thinking:

Throughput can be further divided into **write-throughput** and **read-throughput**.

So, Let's start with what all operations user can perform:
1. Retrieving suggestions [Read Operation]
2. No Write-requests

#### A.1: Read-Throughput
Assume every user performs an average of <span style={{color: "red"}}>10 searchees per day</span>.
Assume a search query consist of <span style={{color: "red"}}>four words with an average word-size of five</span> and search request is intiated every-time user enter new character.
```math
Total Read operations per day = DAU * 10 * (4 * 5) = 10 M * 200 = 2 B read-request per day.
```

### B. Network Bandwidth
#### B: Egress Traffic
Traffic going **out** of the system i.e. read traffic
Assume each suggestions has a size of <span style={{color: "red"}}>20 bytes on an average</span>.
And we have to return <span style={{color: "red"}}>Top-5 suggestions</span>.

```math

Egress = read per second
        = (Total read requests per second) * (Average Suggestion size) * (5)
        = (2B / 24/ 60/ 60) *  (20 bytes) * 5
        = (23.14 K/sec) * (100 b)
        = 2.314 Mbps
```


---
sidebar_position: 2
---

# Capacity Estimation

Assume: 
1. DAU = <span style={{color: "red"}}>1 B users</span>
2. MAU = <span style={{color: "red"}}>2 B users</span>

### A. Throughput [requests per unit of time]


Throughput can be further divided into **write-throughput** and **read-throughput**.

So, Let's start with what all operations user can perform:
1. Send a message [Write-Operation]
2. Message Status change from Sent to Delivered to Seen [Write-Operation]
3. User status change from Last-Seen to Online [Write-operation]
4. Reciever Reads the message [Read-Operation]
5. Sender reads the message-status or user-status [Read-Operation]



#### A.1 Write-Throughput
Assume Each user will send <span style={{color: "red"}}> 10 messages</span> daily on an average.
Also Assume, Each user stays on an average of <span style={{color: "red"}}> 30 minutes</span> on the app, and last-seen is checked every minute.

```math
Total Message-Write operations per day = DAU * 10 = 1 B * 10 = 10B write requests per day
Total Message-status-change per day = (Total-Messages) * (Total states [Sent, Delievered, Read]) = 10B * 3 = 30B message-status write-request per day
Total last-seen-writes per day = DAU * 30 = 30B last-seen writes per day
```

#### A.2: Read-Throughput
Assume every user read each message delivered.
```math
Total Message Read operations per day = Total Messages = 10 B read-request per day.
```

Note: In read-throughput, not covering the last-seen-reads and message-status-change-reads, Since those operations resource-usage is very less compared to reading a whole new message

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


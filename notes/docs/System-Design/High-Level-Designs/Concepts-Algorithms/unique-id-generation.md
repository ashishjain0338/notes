---
sidebar_position: 2
---

# Unique Id Generation in a Distributed System

## Requirements:

1. Id's MUST be unique and numeric.
2. Id's should fit into 64-bit.
3. They should be allocated such that they are sorted over time.
4. Ability to Generate 10,000 id's per second.


## Various Options

### 1. Multi-Master Replication
    Uses the db's `auto-increment` feature, for distributed systems, if there are k different db-instance, we increment the id by `k` rather than 1.
    - Drawbacks
        - Hard to scale with more datacenters.
        - Hard to scale when a db-server is added or removed.
        - The algorithm does not guarantee that IDs are generated in chronological order. For example, consider multiple ID generation requests R1, R2, and R3 arriving at Server S1, which allocates IDs 0, 2, and 4 respectively. Meanwhile, another request R′ arrives at Server S2 and is allocated ID = 1. Even though R′ is a newer request, it receives a smaller ID than R3 (ID = 4), violating the expectation that `newer requests should receive larger IDs`.
        ```
            Server-1: R1(id=0) --> R2(id=2) --> R3(id=4)
            Server-2: R'(id=1)
        ```

### 2. UUID
A `UUID (Universal Unique Identifier)` is a 128-bit value used to uniquely identify an object or entity on the internet. UUIDs are generated using an algorithm based on a `timestamp and other factors, such as the network MAC address etc`.
- Pro
    - Easy to implement and no cordination required between various servers.
    - Easy to Scale
- Cons
    - Id's generated are 128-bit not 64-bit.
    - Id's use hexadecimal chars rather than all numeric.
    - Id's do not go up with time.

### 3. Ticket Server
Ticket Server is like a `centralized auto-incrementor`. All servers requests the ticket-server to get an id.
- Pro
    - Maintains Synchronization
- Con
    - Single-Point-of-Failure

### 4. Twitter Snowflake Approach
The Way of Thinking:
1. Id must be sorted over time, therefore, it signals `Id MUST contain some information about the timestamp`.
2. `10,000 id's per second` signals that there could exists cases where two or more id's are generated over same millisecond.
3. The Collision in Step-2 can occur within a mulitple-server as well as within multiple-datacenters.

We say, Divide the 64-bits as follows


|1-bit      | 41-bit    | 5-bit         | 5-bit     | 12-bits       |
|-----------|-----------|---------------|-----------|---------------|
| Future use| Timestamp | Datacenter-id | Machine_id|Sequence Number|

1. Adding 41-bit timestamp, makes sure id's are chronologically sorted.
2. Datacenter-id and Machine-id are unique for each datacenter and machine within datacenter, avoiding collisions mentioned above in point-3
3. Sequence-id is incremented for each id-generated within the same millisecond, after every millisecond, it resets back to 0.

```
Id-Generation Support:
41-bit Timestamp with millisecond accuracy = 2^41/ 1000/ 60/ 60/ 24/ 365 = 69.7 years.
Support 2^5 (32) datacenters and 32 machines per each datacenters.
12-bit sequence number support 2^12 = 4096 id generation each millisecond.

In Summary, At its best, our machine can support = 4096 * 32 * 32 * 1000 = 4.1 billion unique-ids generation each second for atmax 69.7 years.
```
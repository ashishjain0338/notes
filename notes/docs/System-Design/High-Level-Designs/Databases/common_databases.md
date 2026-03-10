---
sidebar_position: 4
---

# Databases: How do they Work

## A. Redis

1. Primarily `single-threaded in-memory datastore`. Commands are executed sequentially, eliminating the need for locks and enabling very low latency.
2. Key-value datastore supporting rich data structures such as strings, lists, sets, hashes, and sorted sets.
3. Persistence is optional. Redis supports:
   - RDB snapshotting
   - Append Only File (AOF) logging (fsync -> 1 second)
4. Scaling strategies:
   - Replication (master for writes → replicas for read scaling)
   - Sharding using Redis Cluster for horizontal scaling.
5. Cache eviction policies include:
   - LRU (Least Recently Used)
   - LFU (Least Frequently Used)
   - TTL-based eviction


## B. Elastic-Search (Search-Engine)

## C. InfluxDB

## D. DyanamoDb

## E. CassandraDb

## F. MongoDB

## G. Sql
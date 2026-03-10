---
sidebar_position: 3
---

# Different Types of Databases

## A. Caching Solutions

Requirements:
1. Fast
2. Key-Value Pairing
3. Data persistence is not required (data loss is acceptable)

Best to use: **Redis, MemCache, etcd**

## B. File Storage (Images, Videos)

Requirements:

1. Ability to store large binary objects (Blob storage)
2. No need for relational queries or joins on stored data

Best to use: **Amazon S3**

Note: Pair File-Storage with CDN for faster ascess

## C. Text Searching 

Requirements:

1. Keyword-based search
2. Autocomplete / prefix matching (e.g., ap → apple)
3. Fuzzy search (handling typos like apjle → apple)

Best to use: Search-Engines like **Elastic Search or Solr** (Apache Lucene)

## D. Metrics/ Time series data

Requirements:

1. Optimized for time-based data
2. Data written sequentially (append-only pattern)
3. Queries typically involve time ranges and aggregations
4. High write throughput & Time-based partitioning

Best to use: **InfluxDb, TimeScaleDb**

## E. Big Data Analysis (Data Warehouse)

Requirements:

1. Ability to store and process very large datasets (TBs–PBs), Fast Read Throughput.
2. Optimized for analytical queries and aggregations
3. Used mainly for offline reporting and business intelligence
4. Supports `OLAP-style queries` over large datasets

```
Typical OLAP Questions
Examples companies ask:
"What was total revenue per country last year?"
"Which product category grew fastest?"
"What is average user session duration?"
"How many orders per hour?"
```

Best to use: **Hadoop, Redshift, BigQuery, Snowflake**


## F. Sql

1. Data is structured and follows a predefined schema.
2. Requires strong transaction guarantees (ACID).
3. Suitable for systems where `data consistency is critical`.
4. Example: Banking Payment Systems

Best to use: **Postgres, mySql**

## G. Document Db (NoSql)

1. Data is `semi-structured (JSON-like documents)`.
2. Schema is flexible and can evolve easily.
3. Documents may contain many attributes/fields that vary between records.
4. Applications need to query and index these attributes efficiently.
5. Example: User profiles, Product catalogs

Best to use: **MonogoDb (Supports ACID), CouchBase**

## H. Columar Database (NoSql)

1. Designed for very large datasets distributed across many machines.
2. Data is typically append-heavy and continuously growing.
3. Optimized for high write throughput and horizontal scaling.
4. Queries often `access specific columns` across large datasets.

Best to use: **CassandraDb, Hbase**


## Summary

| Type | Best For | Read Throughput | Write Throughput | ACID / BASE | Examples |
|-----|----------|----------------|-----------------|-------------|----------|
| Cache | Fast temporary data, frequently accessed items | Very High | High | BASE | Redis, Memcached |
| Object Storage | Large files (images, videos, backups) | High | Medium | BASE | Amazon S3, Google Cloud Storage |
| Search Engine | Full-text search, autocomplete, fuzzy search | High | Medium | BASE | Elasticsearch, Solr |
| Time Series DB | Metrics, monitoring data, IoT telemetry | High | Very High (append-heavy) | BASE | InfluxDB, Prometheus |
| SQL (Relational DB) | Structured data with strong consistency and transactions | High | Medium | ACID | PostgreSQL, MySQL |
| Document DB | Flexible schema, JSON-like data, evolving structures | High | High | Mostly BASE (some ACID support) | MongoDB, Couchbase |
| Wide Column DB | Massive distributed datasets, high write scalability | Medium | Very High | BASE | Cassandra, HBase |
| Data Warehouse | Large-scale analytics and reporting (OLAP) | Very High (large scans) | Low–Medium | BASE | BigQuery, Redshift, Snowflake |
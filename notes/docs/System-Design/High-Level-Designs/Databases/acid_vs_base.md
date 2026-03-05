---
sidebar_position: 1
---

# ACID vs BASE
`Atomicity-Consistency-Isolation-Durable` vs `Basically-Available-Soft-state-Eventual-Consistency`
## ACID
### 1. Atomicity
Either It happens or not, nothing in between. All or nothing transaction.

### 2. Consistency
The transaction must ensure database consistency rules. Transactions MUST take a database from one consistent state to another.
Examples of such rules: Bank Balance must not be negative, userid must be unique for each user (primary-key) & so-on.

### 3. Isolation
Two transaction T1 and T2 run on a same time must yield the same result when they are run in isolation.

### 4. Durable
Once data is commited, it MUST be persisted i.e. no data-loss even if server fails.


Note: Mostly, all SQl databases like Postgresql, mysql supports `ACID`.


## BASE

### 1. Bascially Available
The system always responds to requests, even if some nodes are failing. i.e. the system may return stale or incomplete data but it never completely refuses service

### 2. Soft State
The system's state may change over time, even without new input, because updates are being propagated asynchronously.
Soft means `Temporarily Inconsistent`

### 3. Eventual Consistency
The system will be consistent eventually.
If no new updates happen, all replicas will eventually converge to the same value.

Note: From CAP theorem, If we ensure AP, that is what BASE is.
It is used in many distributed systems and NoSQL databases where strict ACID guarantees are relaxed in favor of high availability and scalability.


## In Short
| Feature        | ACID                       | BASE                 |
|----------------|----------------------------|----------------------|
| Consistency    | Strong consistency         | Eventual consistency |
| Availability   | May sacrifice availability | Always available     |
| Transactions   | Strict                     | Relaxed              |
| Scalability    | Harder                     | Easier               |
| Used in        | Relational DBs             | Distributed NoSQL    |
| Usage          | Banking Systems            | Like/Comment Count   |

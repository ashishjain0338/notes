---
sidebar_position: 5
---

# Database Selection

## 1. MessageDb
Requirements of `MessageDb` database are as follows:
1. **Huge data volume** (billions of messages)
2. Mostly **recent chats are accessed frequently**
3. Users should be able to random ascess the chats  which is useful for feature like `search, jump to specific messages, view your mentions` etc.
4. Read-to-write ratio is roughly **1:1** (for 1:1 chats)


Best-to-use: Best Choice: NoSQL (Wide-Column DB like Cassandra / HBase)


### Why Columar Db (Need to Verify, when CassandraDb is well understood)

1. **High write throughput**
    - Messaging systems are write-heavy → Cassandra handles massive writes efficiently

2. **Efficient time-based queries**
    - Messages are usually fetched like:
    ```
    "Give me last N messages of a chat"
    ```
    - Wide-column DBs are great for **range queries on sorted keys**

3. **Horizontal scalability**
    - Easy to shard data across nodes (based on user_id / chat_id)

4. **Partitioning support**
    - Example:
    ```
    Partition Key = chat_id
    Clustering Key = timestamp (or message_id)
    ```

    - This ensures:
        - Messages of a chat are stored together
        - Already sorted → fast reads

---


```
messageId       bigInt
from_userId     bigInt
to_userId       bigInt
media_url       text
media_metadata  text
message         text
created_at      timestamp
status          sent| delivered| read
```
Note: Since, messages need to be sorted along time, and 2 messages could be created on same time, We can additionaly avoid this, by allocating messageId in a chronological order. Such that Id's allocated at a given time t will always be greater than t - 1. Eg. **Snowflake Ids**

## 2. GroupsDB
1. Simple Queries
    - Get all users of a group
    - Update Group Metadata

Best-to-use: NoSql

```json
{
    "group_id" : "",
    "group_members": [
        "user_1",
        "user_2",
        ...
    ],
    "metadata":{
        "title": "",
        "description": "",
        ...
    }
}
```

## 3. Last-Seen
1. Very High Write Volume: Writes are done after every heart-beat period for all connected users.
2. Simple Query

Best-to-use: NoSql

```json
{
    "user_id" : "",
    "last_seen": ""
}
```

## 4. Ws-Connection-Info
1. Persistence is not strict: If data is lost, we will just kickstart a new Websocket connection
2. Ultra low latency reads/writes.

Best-to-use: In-Memory Database like Redis

```json
    {
        "user_id": "websocket_session_id",
    }
```
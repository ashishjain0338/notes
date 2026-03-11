---
sidebar_position: 5
---

# Deep-Dive

## Database Modelling

In HLD we shared four databases:
1. Follow-Db
2. Post-Db
3. Feed-Db
3. Like-Db
4. Comment-Db

### A. Follow-Db

Needs to maintain **relationship-data** therefore, graphDb should be used.

### B. Post-Db
1. High Scale (50M per day)
2. Unstructured data i.e media_url for image-post, but not for text-post.
3. Heavy Operations are not generally required

Best-bet- NoSql

```java
{
    "post-id": "",
    "created_by": "",
    "media_url": "",
    "caption": "",
    "created_on": "",
    ...
}
```

### C. Feed-Db
1. Very High Scale (50B per day)
2. Unstructured data: A list of all posts
3. Heavy Operations are not generally required

Best-bet- NoSql
```java
{
    "user-id": "",
    "feed": [
        "post-id1",
        "post-id2",
        ...
    ]
}
```


### D. Like-Db
1. Heavy Operations are not generally required, Only sum of all likes required
2. Data may evolve: additional reactions

Best-bet- NoSql

```java
{
    "like-id": "",
    "post-id": "",
    "created-by": "",
    "created-on": "",
}
```

### E. Comment-Db
1. Heavy Operations are not generally required
2. Data may evolve: comment-in-a-commet
Best-bet- NoSql

```java
{
    "comment-id": "",
    "post-id": "",
    "created-by": "",
    "created-on": "",
    "comment": ""
}
```
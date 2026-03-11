---
sidebar_position: 5
---


# Database Modelling

In HLD we have only one databases:
1. Content-Db

### A. Content-Db
1. High Scale (50M per day)
2. Unstructured data.
3. Heavy Operations are not generally required

Best-bet- NoSql

```java
{
    "video-id": "",
    "meta-data": {
        "title": "",
        "uploaded-by":"",
        "tags" : "",
        ... 
    },
    "manifest": {
        "chunk-1": "loc-1",
        ...
    }
}
```

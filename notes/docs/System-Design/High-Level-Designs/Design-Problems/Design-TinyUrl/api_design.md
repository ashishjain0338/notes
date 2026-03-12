---
sidebar_position: 3
---

# API-Design

Note: 
1. **CRUD** means **POST-GET-PUT-DELETE**
2. It is always good to version your api's

### Create Short-url
```
A. POST /v1/urls
{
        "longUrl" : "",
}

Response: The Short-url: "/short-url"
```

### Accessing Short-Url
```
A. GET /short-url

Response: The Long url
```
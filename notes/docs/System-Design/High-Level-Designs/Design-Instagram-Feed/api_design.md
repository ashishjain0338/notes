---
sidebar_position: 3
---

# API-Design

Note: 
1. **CRUD** means **POST-GET-PUT-DELETE**
2. It is always good to version your api's

### User Related
```
CRUD /v1/user/
{
        "account-details" : {}
}
```

### Post Related
```
CRUD /v1/posts/
{
        "userId": "",
        "post-content": {}
}
```

### Like & Comment
```
# Like
CRD /v1/like/
{
        "postId": "",
        "userId" : ""
}

# Comment
CRUD /v1/comment/
{
        "postId": "",
        "userId" : "",
        "comment": ""
}
```

### Follow/Unfollow
```
CRUD /v1/follow/
{
        "userId": "you",
        "followeeId": "her"
}
```

### Retrieve News Feed
```
GET (C) /v1/feed/<user_id>
```

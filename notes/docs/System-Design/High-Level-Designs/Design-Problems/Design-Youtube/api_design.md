---
sidebar_position: 3
---

# API-Design

Note: 
1. **CRUD** means **POST-GET-PUT-DELETE**
2. It is always good to version your api's

### Content-Upload
```
A. POST /v1/content/upload?uploadType=Resumable
{
        "title" : {},
        "format": {},
        .. so-on metadata
}

Response: A Session URI: /v1/content/upload?uploadType=Resumable?SessionId="abc"

B. Chunk-wise upload
PUT /v1/content/upload?uploadType=Resumable?SessionId="abc"
{
        "BinaryContentData"
}


```

### Content-Stream
```
A. GET /v1/content/watch?contentId=""

Response: A dict of location of each chunk on server (Content-Manifest File)
{
        "Chunk-1" : "Loc-1",
        "Chunk-2" : "Loc-2",
        .. & so-on
}

B. On-demand Streaming

GET /v1/content/watch?chunkId=""
Using HLS Protocol
```
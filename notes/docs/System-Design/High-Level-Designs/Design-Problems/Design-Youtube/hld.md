---
sidebar_position: 4
---

# High Level Design

### 1. Upload-Service

#### 1.1 Metadata Upload and Session-URI response

![Upload-Service-1.1](\img\hld-designs\Youtube-uploads\upload_1.1.png)

<hr />

#### 1.2 Content Chunks Uploader Using Session-URI

1. Users uploads chunks using Session URI.
2. API-Gateway diverts the request to Upload Service.
3. Upload-Service stores the chunk at Object-Storage.
4. Upload-Service pushes an event to message queue signalling/requesting post-processing over uploaded chunk.
5. `Post-Upload Chunk Processor` listens to the event.
6. `Post-Upload Chunk Processor` fetches the chunk from Object-Storage and starts processing.
7. After processing, chunks are pushed to `CDN` and location of chunks are written back to `ContentDb`.
8. An event is generated to message-queue signalling upload-completion.
9. `Notification-Service` listens to the event.
10. `Notification-Service` notfies the user about the completed upload.


![Upload-Service-1.2](\img\hld-designs\Youtube-uploads\upload_1.2.png)

<hr />

#### 1.3 Post-Upload Chunk Processor

As an Example, Post-Upload Chunk Processor can involve the following services:
1. `Content Chunker Service`
- Breaks the uploaded chunks into more smaller pre-defined chunk-lengths(10 secs).
- Fetches chunks from Object-Storage, breaks them and stores them back to Object-Storage and then generates an event back to MessageQ in order to picked up by next-service.

2. `Format Creator Service`
- Converts the format of videoes to mp4, mov etc.

3. `Quality Convertor Service`
- Converts the quality to predefined formats: 720p, 1080p, 240p, 4K etc.

4. `CDN-Uploader Service`
- Fetches the `processed-chunks` from Object-Storage.
- Stores them at CDN
- Stores the location of each chunk at ContentDB

![Upload-Service-1.3](\img\hld-designs\Youtube-uploads\upload_1.3.png)

<hr />

### 2. Stream-Content

![Stream-Service-1.3](\img\hld-designs\Youtube-uploads\stream_content.png)


<hr />

For excalidraw file, click [here](\excalidraw\hld\youtube_v1.excalidraw) to download
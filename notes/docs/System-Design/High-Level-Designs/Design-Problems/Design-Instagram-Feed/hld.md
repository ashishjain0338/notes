---
sidebar_position: 4
---

# High Level Design

### 1. Follower Service

Graph-Db is used to maintain follower-followee like relationship data.

![Follow-Service](\img\hld-designs\Instagram-feed\follow-service.png)

<hr />
### 2. Create a post

Since, Feed is requested by user more frequently, therefore we will update feed of all the follower whenever the user creates a post.

For media uploads, pre-signed url service is used, that provides pre-authenticated url to the user to upload the media directly to Object-Storage, then afterwards, the user will only send the media-url to post-service for creating the post.

![Follow-Service](\img\hld-designs\Instagram-feed\post-creation-service.png)

<hr />

### 3. Read News-Feed

CDN will be used to pull static media.

![Follow-Service](\img\hld-designs\Instagram-feed\feed-reader.png)

<hr />

### 4. Post-interaction [Likes/comment]

Added an additional notification service to notify the post-owner

![Follow-Service](\img\hld-designs\Instagram-feed\post-interaction-service.png)

<hr />

For excalidraw file, click [here](\excalidraw\hld\instagram_v1.excalidraw) to download
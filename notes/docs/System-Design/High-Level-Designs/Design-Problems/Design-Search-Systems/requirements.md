---
sidebar_position: 1
---

# Requirements

## Functional Requirements

Search Systems like searching at Amazon, Twitter & so-on.
The system should support the following:
1. Users can search by keywords, hashtags or usernames.
2. Should support `fuzzy search` for mistyped queries.

## Non-Functional Requirements

The system should be:
1. Six Nines Available: 99.9999 % availability
2. Low latency: Search result should load quickly.
3. Scalability


## Search API
```
GET /v1/search?query=hello
```
---
sidebar_position: 4
---

# High Level Design

## Rate-Limiter as a Middleware

Redis is used as an in-memory key-value database for fast access to counters, making rate-limiting checks very low latency.


![Rate-Limiter-1](\img\hld-designs\Rate-limiter\rate-limiter-1.png)
<hr />

## Deep-dive: Rules

**Question:** How do we configure and manage rate-limiting rules?

The rules (limits) are stored in a persistent database (Rules DB). Workers periodically check for any changes in these rules. If an update is detected, the new rules are processed and pushed to an in-memory cache (Rules Cache).

The rate limiter then reads from this Rules Cache to enforce limits in real time.


![Rate-Limiter-rules-1](\img\hld-designs\Rate-limiter\rate-limiter-with-rules.png)

<hr />

For excalidraw file, click [here](\excalidraw\hld\rate_limiter_v1.excalidraw) to download
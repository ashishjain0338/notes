---
sidebar_position: 3
---

# Rate Limiter Theory

## Benefits
1. Prevents Resources starvation caused by DenialofService (DoS) attack.
2. Ensure Fair Service.
3. Prevents Server Overloading
4. Reduce Cost

## Gateway vs Server-Side Rate-Limiter Implementation

| Gateway | Server-Side |
| ------ | ----------- |
| `User --> Rate-Limiter --> App` | `User --> [Rate-Limiter & App]` |
| Blocks malicious or excessive traffic before it reaches the application, reducing the load on the app servers. | The application itself performs rate limiting, so the app servers handle both business logic and rate-limiting checks. |
| Can become a **Single Point of Failure (SPOF)** if the gateway goes down (unless deployed in a distributed or highly available setup). | Each application replica can enforce its own rate limiting, so there is **no single point of failure**. |
| Typically enforces a **global rate-limiting policy** for all services behind the gateway. | Each service or server can implement its **own custom rate-limiting logic or algorithm**. |

## Rate-Limiting Algorithms

### 1. Token Bucket Algorithm

In simple terms, imagine you have a bucket filled with tokens. Every request uses up one token. If the bucket runs out of tokens, incoming requests get throttled. Over time, tokens are added back into the bucket at a fixed rate.

Parameters you can tune: `Bucket-Size` and `Token-Refil Frequency`

```python
# Thread-1
for r in request:
    if bucket["token"] <= 0:
        throttle_request(r)
    else:
        serve_request(r)
        bucket["token"] -= 1

# Thread-2
while True:
    bucket["token"] = BUCKET_SIZE
    time.sleep(int(TOKEN_REFIL_FREQUENCY))
```

**Pros:**
1. Easy to implement.
2. Memory Efficient.
3. Can Handle Burst of traffic.

**Cons:**
1. Tunning of `Bucket-Size` and `Token-Refil Frequency` might be challenging.

### 2. Leaking-Bucket Algorithm

In simple terms, imagine you have a queue. Incoming requests are added to the queue, and the server processes them at its own speed. If the queue becomes full, any new incoming requests get throttled.

The key difference from the previous approach is that instead of `immediately throttling excess requests, you allow them to wait in a queue` (up to a limit). These requests are then processed later at a fixed rate, following FIFO.

Parameters you can tune: `Queue-Size`

```python
# Thread-1
for r in request:
    if q.full():
        throttle_request(r)
    else:
        q.push(r)

# Thread-2
while True:
    if not q.empty():
        serve_request(q.front())
        q.pop()
```

**Pros:**
1. Memory efficient (you only need to manage the queue size).
2. Requests are processed at a steady, fixed rate, which is useful when you need a stable output rate. 

**Cons:**
1. A sudden traffic burst can quickly fill up the queue. If it doesn’t get drained in time, new incoming requests will start getting throttled.


### 3. Fixed Window Counter Algorithm

The time axis is divided into fixed intervals (for example, 1 minute or 1 second). For each incoming request, a counter is incremented. If the counter is within the allowed limit, the request is served; otherwise, it is throttled.

```python
# Thread-1
for r in request:
    if counter >= LIMIT:
        throttle_request(r)
    else:
        serve_request(r)
        counter += 1

# Thread-2
while True:
    counter = 0
    time.sleep(int(FIXED_WINDOW_INTERVAL))
```

**Cons:**
1. This algorithm can allow more traffic than intended, especially when bursts happen near the boundary of time windows.

**Example:**

Request limit: 5 requests per minute

At the edge of a time window:
- Window 1 (t = 55–60): 5 requests arrive and are served  
- Counter resets  
- Window 2 (t = 60–65): 5 more requests arrive and are served  

The problem is that between t = 55–65, a total of 10 requests are served within just 10 seconds, even though the limit is 5 requests per minute.


### 4. Sliding Window Log Algorithm

Each request’s timestamp (whether it is `served or throttled`) is stored in a log (or something like a `Sorted Set`). For every new request, outdated entries are removed from the log. If the number of remaining entries is within the allowed limit, the request is served; otherwise, it is throttled.

```python
log = queue.queue()
# Thread-1
def clean_log(log: queue.Queue):
    curTime = time.Now()
    while not log.empty():
        entry = log.front()
        if curTime - entry > TIME_WINDOW:
            entry.pop()
        else:
            break
def main():
    for r in request:
        clean_log(log)
        if log.size() >= LIMIT:
            throttle_request(r)
        else:
            serve_request(r)
        # Add the current request (throttled or served) to the log
        log.push(time.now())
```

**Pros:**
1. Guarantees that the number of requests never exceeds the limit in any rolling window.

**Cons:**
1. Uses a lot of memory, since every request’s timestamp (served or throttled) needs to be stored.

### 5. Sliding Window Counter Algorithm

The idea here is to approximate the number of requests in a rolling window by combining the counts from the current window and the previous window.

Instead of treating windows as completely separate (like in Fixed Window), we "blend" them based on how much of the previous window overlaps with the current time.

```python

def estimate_request_count(cur_request_count, prev_request_count, cur_window_start_time, window_size = WINDOW_SIZE):
    cur_time = time.now()
    elapsed_time = cur_time - cur_window_start_time

    overlap_fraction_prev_window = 1 - (elapsed_time / window_size)

    req_count = cur_request_count + (overlap_fraction_prev_window * prev_request_count)
    return req_count

def main():
    # Thread-1
    for r in request:
        req_count = estimate_request_count(cur_request_count, PREV_REQUEST_COUNT, WINDOW_START_TIME)
        if req_count > LIMIT:
            throttle_request(r)
        else:
            serve_request(r)
        cur_request_count += 1

    # Thread-2:
    # Reset state at every window
    while True:
        PREV_REQUEST_COUNT = cur_request_count
        WINDOW_START_TIME = time.now()
        cur_request_count = 0
        time.sleep(WINDOW_SIZE)
```

**Pros:**
1. Smooths out traffic spikes compared to fixed window.
2. Memory efficient (only keeps counters, not individual timestamps).

**Cons:**
1. It’s still an approximation, not exact.
2. Assumes a roughly uniform distribution of requests within a window.
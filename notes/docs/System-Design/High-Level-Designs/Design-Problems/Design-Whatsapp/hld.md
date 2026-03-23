---
sidebar_position: 4
---

# High Level Design

## 1. Service Discovery (WebSocket Connection Setup)

1. When the user opens the app, the client sends a **WebSocket connection request** to the API Gateway.
2. The API Gateway forwards this request to the `Service Discovery` service.
3. `Service Discovery` picks an appropriate `Chat Service` instance based on:
   - Current load
   - Geographic proximity (for lower latency)
   - Other routing factors (like availability, health, etc.)
4. The client is then connected to the selected `Chat Service` via WebSocket.
5. Connection metadata (like user → server mapping) is stored in a `ws-connection-info` datastore.


**Note:**
- This `ws-connection-info` will be **read very frequently** (for routing messages).
- Strong persistence is usually **not critical** (connections are short-lived and can be rebuilt).

So, using **Redis (in-memory store)** is a good choice here

---

![service-discovery](\img\hld-designs\Whatsapp\service_discovery.png)

## 2. One-on-One Chat Messaging

1. `User-A` sends a message over an active WebSocket connection to a chat server (say `Chat-Service-1`).
2. The message is forwarded to a `Message Service`.
3. `Message Service` stores the message in `MessagesDB`.
4. `Chat-Service-1` looks up `ws-connection-info` to find where `User-B` is connected (say `Chat-Service-N`).
5. Now, two cases:

   - **User-B is online:**
     ```
     Chat-Service-1 → Chat-Service-N → User-B
     ```

   - **User-B is offline:**
     - A push notification is triggered
     - Message stays stored in DB until User-B comes online

![one-on-one-chat](\img\hld-designs\Whatsapp\one-on-one-chat.png)

---
### 2.1 When User-B Comes Online

1. `User-B` connects to a chat service (say `Chat-Service-N`).
2. Client requests **unread messages** via Chat Service → Message Service.
3. `Message Service` fetches unread messages from DB and returns them.
4. Messages are delivered to `User-B`.

Simple idea: **DB acts as the source of truth for missed messages**

---

### 2.2 Message Status Flow (Sent → Delivered → Read)

1. **Sent**
   - Message is successfully stored in DB
   - Status = `Sent`
   - Ack sent back to `User-A`

2. **Delivered**
   - Message reaches `User-B`'s device
   - `User-B` sends acknowledgment
   - Status = `Delivered`
   - Update sent to `User-A`

3. **Read**
   - `User-B` opens the message
   - Client sends "read" acknowledgment
   - Status = `Read`
   - Update sent to `User-A`

These are just **state transitions backed by acknowledgments**

---

### 2.3 Handling Media Messages (Images, Videos, Docs)

1. Media is **NOT sent directly via chat servers**. 
   Instead:
   - Client uploads media to object storage (like S3) using **pre-signed URLs**
   - Only the **media URL + metadata** is sent as part of the message
2. Message delivery works exactly like normal text messages.
3. When `User-B` receives the message:
   - Client downloads media directly from object storage
   - Displays it to the user

---

## 3. Last-Seen / Presence Info

1. `User-A` periodically sends a **heartbeat** (say every ~30–60 seconds) over the existing WebSocket connection.
2. The request hits the `Chat Service`, which forwards it to the `Presence Service`.
3. `Presence Service` updates the **latest timestamp** for `User-A` in `PresenceDB`.

Simple idea:  
**“If we’ve heard from you recently → you’re online”**

![one-on-one-chat](\img\hld-designs\Whatsapp\last-seen.png)
---

### 3.1 How Last-Seen is Calculated

```python
threshold = 60
if time.Now() - last_seen_timestamp < threshold:
    return online()
else:
    return last_seen_timestamp

```

### 3.2 Fetching Presence Info

#### Option 1: Simple Request Model (Pull-based)

- User asks:
    ```
    "What is User-A’s last seen?"
    ```
- Flow:
    ```
    Client → Chat Service → Presence Service → DB
    ```
- Presence Service:
    - Checks last timestamp
    - Decides Online / Offline
    - Returns last-seen

**Pros:**
- Simple
- Easy to implement

**Cons:**
- Not real-time
- Frequent polling can add load

#### Option 2: Subscriber Model (Push-based)

- User subscribes to presence updates of `User-A`
- Whenever `User-A`’s status changes:
- `Presence Service` generates an event
- Event is pushed to all subscribers via Chat Service

**Pros:**
- Real-time updates
- Better user experience

**Cons:**
- More complex (needs pub-sub / event system)
- Needs efficient fan-out handling at scale

---


## 3. Group-Messaging
Flow is mostly similar to **one-on-one messaging**, just with a **fan-out to multiple users**.

1. `User-A` sends a message to group `G1` via WebSocket to `Chat-Service-1`.
2. `Chat-Service-1` forwards the message to `Message Service`.
3. `Message Service` stores the message in `MessagesDB`.
4. It then publishes a **message event** to a message queue.
5. `Group Service` consumes this event.
6. `Group Service` fetches all members of `G1` from `GroupsDB`.
7. For each member (except `User-A`):
   - Lookup `ws-connection-info` to find their connected chat server
8. The group-Service then forwards the message to all such user via their respective chat-service

![group-chat](\img\hld-designs\Whatsapp\group-chat.png)

### 3.1 What’s Really Happening (Fan-out Pattern)

This is a classic **fan-out** problem:

- 1 message → N users
- Needs to be:
- Fast
- Scalable
- Fault-tolerant

---

#### Two Common Fan-out Strategies

#### 1. Fan-out on Write (Push Model)

- Message is **immediately pushed** to all group members

**Pros:**
- Real-time delivery
- Simple read path

**Cons:**
- Expensive for large groups (N writes / deliveries)
- Can overload system for very large groups

---

####  2. Fan-out on Read (Pull Model)

- Store message once
- Deliver only when users fetch messages

**Pros:**
- Efficient for large groups
- Less immediate load

**Cons:**
- Higher latency
- More complex read logic

---

In reality, systems like WhatsApp use a **hybrid approach**:
- Small groups → Fan-out on write
- Large groups → Optimized / partial fan-out

---

For excalidraw file, click [here](\excalidraw\hld\whatsapp_v1.excalidraw) to download
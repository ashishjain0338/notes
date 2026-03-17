---
sidebar_position: 4
---

# High Level Design

### 1. Create Tiny-Url Service


![Create_url-1](\img\hld-designs\TinyUrl\create-tinyurl-1.png)

#### URL Generation Service (Handling Collisions)

1. One approach to generating short URLs is to create **random strings** and check for collisions. If a collision occurs, the system regenerates a new string. The drawback of this approach is that, in the **worst case**, the system may repeatedly encounter collisions, which can increase latency and make the system less efficient.
2. Another method is to generate a unique string from the input using a **hashing algorithm** such as MD5. While this approach ensures uniqueness, the generated strings are typically **long**, whereas the goal of a URL shortener is to produce **short URLs**.
3. A more reliable approach is to use **incrementing counters**. For example, the first request could receive `tinyurl/0`, the second `tinyurl/1`, and so on. This guarantees uniqueness. However, in a **distributed system with multiple servers**, the counters must remain synchronized across all servers.

    To solve this issue, a coordination service such as **Zookeeper** can be used.
    - Each server requests a **range of counters** from Zookeeper.
    - Zookeeper ensures that each server receives a **non-overlapping counter range**.
    - Example:
        - Server-1: `[0, 1000]`  
        - Server-2: `[1001, 2000]`  
        - Server-3: `[2001, 3000]`
    - This allows each server to generate unique short URLs **independently** within its assigned range.

    Another optimization involves improving the **encoding scheme**. Currently, if we use only digits `[0–9]`, each position can represent **10 possibilities** (Base10 encoding). Instead, we can use **Base62 encoding**, which includes `[0–9 + A–Z + a–z]`.

    ```
    For a fixed code length of 2, Information Storing Capacity for :
    Base10 = 10 * 10 = 100 ways
    Base62 = 62 * 62 = 3844 ways

    Therefore, Base62 will store way more information than Base10 
    ```

![Create_url-1](\img\hld-designs\TinyUrl\create-tinyurl-2.png)
<hr />



### 2. Ascess Tiny-Url Service

The resposne can be returned with either `response-code: 301` or `responsec-code: 302` signalling to re-direct to the url specified within the `location` header.

|Status-Code| Name                       | Description                        |
|-----------|----------------------------|------------------------------------|
| 301       | Permanently Moved Redirect | The Browser cahces the response, and further calls will not go back to the tinyUrl server |
| 302       | Temporarily Moved Redirect | Subsequent calls will go to the tinyUrl server each time to retrieve longUrl |


![ascess-url-1](\img\hld-designs\TinyUrl\ascess-tinyurl-1.png)

<hr />

For excalidraw file, click [here](\excalidraw\hld\tinyurl_v1.excalidraw) to download
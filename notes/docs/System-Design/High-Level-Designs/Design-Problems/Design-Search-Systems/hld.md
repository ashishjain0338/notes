---
sidebar_position: 4
---

# High Level Design

## Searching

1. User intiates a search requests. Eg: Searching `Quantom Computing`
2. The API-Gateway forwards the request to `Search-Service`
3. The `Seach-Service` searches in indexDb (and Cache) for any keyword hit.
4. If such keyword is not found, then request is forwarded to `Query Correction Service`, to provide closest correct query/word based on various factors such as edit-distance, context, relevance etc. Then, Search-Service searches the `corrected-search-request` within the `IndexDb`
5. Tweets are fetched from the `tweetsdb` (and Cache) corresponding to the indexes returned within previous steps.
6. The Tweets are then sent to `Ranking Service` which ranks them according to user needs. Eg: latest-to-oldest ranking, maximum liked tweeted ranking, most relevant first etc.


---

![ascess-url-1](\img\hld-designs\Search-System\search.png)
img/hld-designs/Search-System/search.png
---

For excalidraw file, click [here](\excalidraw\hld\search-system-v1.excalidraw) to download
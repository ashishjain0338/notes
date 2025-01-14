---
sidebar_position: 1
---
# Routing

Routing simply means creating a route/linking a link with a page/React Component 


#### Install package

    ```bash
    npm install react-router-dom
    ```

#### Define Routes in App.js

    ```js
    import { BrowserRouter, Routes, Route } from "react-router-dom";

    return (
    <div>
        <p>Your App</p>
        <BrowserRouter>
        <Routes>
            <Route path="/">
            <Route index element={<Home />} />
            <Route path="blogs" element={<Blogs />} />
            <Route path="contact" element={<Contact />} />
            <Route path="*" element={<NoPage />} />
            </Route>
        </Routes>
        </BrowserRouter>
    </div>
    )
    
    ```

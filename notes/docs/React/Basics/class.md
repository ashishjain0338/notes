---
sidebar_position: 3
---
# React Component as Class

Creating a Basic React Component as a Class

    ```js
    import React from "react";

    class HomePageClass extends React.Component{
        // Optional
        constructor(){
            super();
            console.log("Constructor Called");
            this.dummy = "123"
        }

        // Mandatory
        render(){
            return (
                <div>
                    <p>Hello from Class Component</p>
                    <p>Your Class Attribute : {this.dummy}</p>
                </div>
            )
        }
    }

    export {HomePageClass}
    ```

Usage:
```js
// Import the Component
import { HomePageClass } from './components/playground/classhomepage/classHomePage';

// Use it as
<HomePageClass />
```


Note: <br></br>
Functional components are the preferred choice for modern React development due to their simplicity, compatibility with Hooks, and performance benefits. Class components are still valid but are mostly used in legacy applications or specific scenarios like error boundaries.

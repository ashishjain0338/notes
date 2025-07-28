---
sidebar_position: 2
---
# React Component as Function

Create a basic Function Component

    ```js 
    function HomePage(){
        // Returning the HTML-DOM
        return (
            <div>
                <p>Hello World</p>
            </div>
        )
    }

    // Export the function so that we can import it in App.js
    export { HomePage }
    ```

Usage

    ```js
    // Import the function
    import { HomePage } from './components/homepage/homepage';
    // Use it as
    <HomePage />
    ```
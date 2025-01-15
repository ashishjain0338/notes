---
sidebar_position: 1
---

# Bootstrap in React

#### Install package

    ```bash
    npm install bootstrap react-bootstrap
    ```

Globally Import bootstrap in `index.js`

    ```js
    // index.js
    import 'bootstrap/dist/css/bootstrap.css';
    import 'bootstrap/dist/js/bootstrap.js';
    ```

Usage:
```js
// One Way (Bootstrap-as-usual)
return (
    <div>
        <button className="btn btn-sm btn-outline-secondary" type="button">Bootstrap Button</button>
    </div>
)

// Another Way (Bootstrap-as-component)
import Button from 'react-bootstrap/Button';

return (
    <div>
        <Button variant="success">Success</Button>
    </div>
)
```

For various components, Please refer to official `React-Bootstrap Documentation` [here](https://react-bootstrap.github.io/docs/getting-started/introduction)
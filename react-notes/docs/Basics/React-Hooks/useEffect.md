---
sidebar_position: 2
---

# useEffect

`useEffect` is a React Hook that lets you perform side effects in functional components, such as data fetching, subscriptions, or directly interacting with the DOM. It runs after the component renders and can be configured to run conditionally based on dependencies.

<br></br>

### Syntax
```js
useState(<SETUP_FXN>, <DEPENDENCY_LIST>)

where SETUP_FXN will be called after `first-render` and then after everytime when any variable/ state from DEPENDENCY_LIST is changed.

Example:
useState(() => {}, [])
```
<br></br>

### Try-it-yourself:

```js
import { useEffect, useState } from "react"
import { Button } from "react-bootstrap"

function Play(){
    const [useEffectDependent, setUseEffectDependent] = useState(1)
    const [useEffectIndependent, setUseEffectIndependent] = useState(1)

    useEffect(function(){
        console.log("This use-effect will be called only after first-render AND everytime useEffectDependent Variable is changed");
    },
        [useEffectDependent]
    )

    useEffect(function(){
        console.log("This use-effect will be called only after first-render");
    },
        []
    )

    useState(() => {}, [])

    console.log("Rendering Components")
    return (
        <div>
            <p>Current useEffectDependent variable value is {useEffectDependent}</p>
            <p>Current useEffectIndependent variable value is {useEffectIndependent}</p>
            <Button variant="outline-primary" className="ms-3" onClick={() => setUseEffectDependent(useEffectDependent + 1)}>useEffect Dependent</Button>
            <Button variant="outline-primary" className="ms-3" onClick={() => setUseEffectIndependent(useEffectIndependent  + 1)}>useEffect Independent</Button>
            {console.log("HTML Component Rendered")}
        </div>
    )
}

export {Play}
```


Keep adding any other case, that you find missing and useful
else,
For more information, Please refer official Documentation [here](https://react.dev/reference/react/useEffect)
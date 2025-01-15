---
sidebar_position: 1
---

# Parent to Child Communication

A Parent can communicate to its child with the help of `props` as follows:

```js
<Child id="2">

// Usage in Child
function Child(props){
    console.log(props.id);
}
```

Note: Whenever a Parent re-renders,It will re-render all of its child even if the Child props are not changed, verify this in the following example 

```js
import { Button } from "react-bootstrap"
import { useState } from "react"

function Child(props){
    return(
        <div>
            <hr></hr>
            <p>Id of Child is '{props.id}'</p>
            <p>The Value of Parent Counter is {props.counter}</p>
            {console.log('Child with id = ' + props.id + '  Rendered')}
            <hr></hr>
        </div>
    )
}

export {Child};

function Parent(){
    const [counter, setcounter] = useState(1)
    
    console.log("Rendering Components")
    return (
        <div>
            <Child id="Parent-dependent-counter" counter={counter}></Child>
            <Child id="Constant Counter" counter="0"></Child>

            <Button variant="outline-primary" className="ms-3" onClick={() => setcounter(counter  + 1)}>Increment Counter</Button>
            {console.log("Parent Rendered")}
        </div>
    )
}

export {Parent}
```


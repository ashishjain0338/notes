---
sidebar_position: 3
---

# React.Memo

Whenever a parent component re-renders, all its child components also re-render, even if their props haven’t changed. This leads to unnecessary re-renders, which can negatively impact performance. To address this, React introduced `React.memo`, which memoizes functional components. It caches the rendered output of the component based on its props and ensures that `the component re-renders only when its props change`.


### Syntax
```js
React.memo(<Component>, <arePropsEqual?>)

// Example
React.memo(() => {})
```

where:
Component: The component that you want to memorize. The memo does not modify this component, but returns a new, memoized component instead. Any valid React component, including functions and forwardRef components, is accepted.

optional arePropsEqual: A function that accepts two arguments: the component’s previous props, and its new props. It should return true if the old and new props are equal: that is, if the component will render the same output and behave in the same way with the new props as with the old. Otherwise it should return false. Usually, you will not specify this function. By default, React will compare each prop with Object.is.



### Try-it-Yourself
Note which component will render after the button click
```js
import { Button } from "react-bootstrap"
import { useState } from "react"
import React from "react";

const Child = React.memo((props) => {
    return(
        <div>
            <hr></hr>
            <p>Id of Child is '{props.id}'</p>
            <p>The Value of Parent Counter is {props.counter}</p>
            {console.log('Child with id = ' + props.id + '  Rendered')}
            <hr></hr>
        </div>
    )
})

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

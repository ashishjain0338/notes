---
sidebar_position: 1
---
# useState

Using `useState`, we can add a state variable to a functional component. Whenever the state variable is updated, it triggers a `re-render` of the component to reflect the new state.

### Syntax
```js
const [<VAR_NAME>, <MODIFY_FXN_NAME>] = useState(<DEFAULT_VALUE>)
// Updating State
<MODIFY_FXN_NAME>(<NEW_VALUE>);
```

Note:
1. MODIFY_FXN will re-renders the component if and only if the value of VAR is changed.
2. The value of VAR will happen as --> (current-fxn-call --> Var-change --> Re-render) i.e. the current-fxn-call MUST finish and then the var-value will change, for reference, see the implementation and result of `incrementStateCase2`


### Example:
```js
import { useState } from "react"
import { Button } from "react-bootstrap"

function Play(){
    const [state, setState] = useState(1)

    function incrementStateCase1(){
        // Note that the component will re-render always when state is changed
        setState(state + 1);
    }

    function incrementStateCase2(){
        // Now that the state will only increment by 1, not by 3
        setState(state + 1);
        setState(state + 1);
        setState(state + 1);
    }

    function incrementStateCase3(){
        // If after calling the setState, the value is same, the component won't re-render
        setState(state);
    }

    console.log("Rendering Components")
    return (
        <div>
            <p>Current State-Variable is {state}</p>
            <Button variant="outline-primary" className="ms-3" onClick={incrementStateCase1}>Case-1</Button>
            <Button variant="outline-primary" className="ms-3" onClick={incrementStateCase2}>Case-2</Button>
            <Button variant="outline-primary" className="ms-3" onClick={incrementStateCase3}>Case-3</Button>
        </div>
    )
}

export {Play}
```

Keep adding any other case, that you find missing and useful
else,
For more information, Please refer official Documentation [here](https://react.dev/reference/react/useState)
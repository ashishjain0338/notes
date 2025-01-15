---
sidebar_position: 3
---

# Card With Hover Effect
<hr></hr>

![Default-Card](/img/cards/card_default.png)
![Hovered-Card](/img/cards/card_hovered.png)

```js
import './play.css'
import Card from 'react-bootstrap/Card';

function Play() {
  return (
    <div className='container' style={{marginTop: '10px'}}>
        <Card className="mycard">
            <Card.Body >
                <Card.Title>Card Title</Card.Title>
                <hr></hr>
                <Card.Text>Hey There this is card description</Card.Text>
            </Card.Body>
        </Card>
        </div>
  );
}

export {Play};
```

Under play.css
```css
.mycard{
    border: 2px solid transparent; /* Set an initial transparent border */
    transition: border-color 0.3s ease; /* Smooth transition for hover effect */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* Subtle shadow for the default state */
}

.mycard:hover {
    border-style: solid;
    border-width: 2px;
    /* border-color: rgb(84, 142, 201); */
    border-color: #86b7fe;
    /* Stronger shadow for the lifted effect */
    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.3), 0 4px 6px rgba(0, 0, 0, 0.2);
    /* Lift the card slightly upwards */
    transform: translateY(-10px); 
}
```
# Local & Session Storage

```js
const saveObjectToLocalStorage = (key, obj) => {
  localStorage.setItem(key, JSON.stringify(obj));
};

// Retrieve an object
const getObjectFromLocalStorage = (key) => {
  const storedValue = localStorage.getItem(key);
  return storedValue ? JSON.parse(storedValue) : null; // Convert back to an object
};
```
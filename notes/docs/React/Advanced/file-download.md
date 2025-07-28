---
sidebar_position: 4
---

# Download File

On a Button Click, we can allow the user to download files as follows:

```js
import { useState, useEffect } from "react"
import { Button } from "react-bootstrap"
import { InputGroup, Form } from "react-bootstrap";

import React from "react";

function Play() {
  const handleDownload = () => {
    const data = {
      name: "John Doe",
      age: 30,
      job: "Developer"
    };

    // Create a Blob from the JSON data
    const jsonBlob = new Blob([JSON.stringify(data, null, 2)], {
      type: "application/json"
    });

    // Create a temporary anchor element for download
    const link = document.createElement("a");
    link.href = URL.createObjectURL(jsonBlob);
    link.download = "data.json"; // Specify the file name
    link.click(); // Simulate a click to start the download
  };

  return (
    <button onClick={handleDownload}>Download JSON</button>
  );
}

export { Play }

```
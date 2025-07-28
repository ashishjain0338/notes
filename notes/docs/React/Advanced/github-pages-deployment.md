---
sidebar_position: 3
---

# Deploying React-App on Github-Pages

We can host out react-static-application on github-pages as follows:

    ```bash
    # Install package
    npm install gh-pages --save-dev
    ```

Modify `Package.json` as:

    ```json
    Add the following attribute:
    "homepage": "http://{github-username}.github.io/<REPO_NAME>",


    # Append the following to scripts 
    "scripts": {
    ...
    "predeploy" : "npm run build",
    "deploy" : "gh-pages -d build"
    }
    ```

Create a new-file `public\_redirects` with contents

    ```text
    /*    /index.html  200    
    ```

This will configure the redirects appropriately

Now, Commit and push your changes:<br></br>
In order to Deploy, run the following command which will build the project and push it to 'gh-pages' branch from which it will be deployed, that can be verify from Settings > Pages in our Repo-Settings

    ```bash
    npm run deploy
    ```

For more information, Please refer [here](https://blog.logrocket.com/deploying-react-apps-github-pages/#what-github-pages)
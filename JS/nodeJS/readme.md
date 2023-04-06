### 🐤 child_process
```js
const { exec } = require('child_process');

exec('dir', (error, stdout, stderr) => {  
    if (error) {
      console.error(`error: ${error.message}`);
      return;
    }if (stderr) {
      console.error(`stderr: ${stderr}`);
      return;
    }console.log(`stdout:\n${stdout}`);
  });
```
#### spawn
````js
const { spawn } = require('child_process');
const subProcess = spawn("node", ["index.js"]);
subProcess.stdout.on('data', (data) => {
    console.log(`stdout:\n${data}`);
  });
subProcess.stderr.on('data', (data) => {
    console.error(`stderr: ${data}`);
  });
subProcess.on('error', (error) => {
    console.error(`error: ${error.message}`);
  });
subProcess.on('close', (code) => {
    console.log(`child process salida ${code}`);
  });
```

## 🐤 child_process
### exec
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
### spawn 
> Unlike exec which works with callbacks, spawnworks with streams. This allows us to run processes much longer and in a much more asynchronous way.
```js
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
### fork
> Messages between a parent and child process created by forkthey are accessible through Node global object called “process”. Also, with forkwe can control when a child process starts an activity or also return data from a child process to a parent process and vice versa.
>
> child.js
```js
setTimeout(() => {
  process.send("Hello father, I send this information")
}, 5000);
```
> parent.js
```js
const { fork } = require('child_process');const subProcess = fork("./child.js");subProcess.on('message', (message) => {
  console.log(`I get this from the son : ${message}`);
});
```

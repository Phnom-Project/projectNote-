### playwright
> playwright library
```shell
#init 
npm init playwright@lastest [projectName]
#installation
npm i -D playwright
#execution
node index.js
```
> index.js
```js
const { chromium, firefox, webkit } = require('playwright');

(async () => {
  const browser = await chromium.launch();  // Or 'firefox' or 'webkit'.
  const page = await browser.newPage();
  await page.goto('http://example.com');
  // other actions...
  await browser.close();
})();
```

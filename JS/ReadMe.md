## create project
```shell
npm init
npm run start (config in package.json)
```
## Rollup js
> format: 'iife',name: 'vayso'
> <script type="text/javascript" src="g.js"></script>
> vayso.good(), vayso.sayHello('home')
```js
var vayso = (function (exports) {
    'use strict';
    function sayHelloTo( name ) {
      const toSay = `Hello, ${name}!`;
      return toSay;
    }
    const addArray = arr => {
      const result = arr.reduce((a, b) => a + b, 0);
      return result;
    };
    addArray([1, 2, 3, 4]);
    document.getElementsByClassName('debug__output')[0];
    function good() {
        console.log('go to school');   
    }
    exports.good = good;
    exports.sayHelloTo = sayHelloTo;
    Object.defineProperty(exports, '__esModule', { value: true });
    return exports;
  }({}));
```

### configuration
> webpack.config.js(https://webpack.js.org/configuration/output/)
```js
const path = require('path');

module.exports = {
  entry: './src/index.js',
  output: {
    library: 'birdware',
    libraryTarget: 'umd',
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist'),
  },
};
```

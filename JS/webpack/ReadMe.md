### configuration
> webpack.config.js
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

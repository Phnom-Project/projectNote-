### cheerio
#### replace and trim
```js
import * as cheerio from 'cheerio';
import * as fs from 'fs';

const buffer = fs.readFileSync('./fb.html');

const $ = cheerio.load(buffer);

//console.log($('.x11i5rnm.xat24cr.x1mh8g0r.x1vvkbs.xtlvy1s.x126k92a').text());

//fs.writeFileSync('tmp2.txt', $('.x11i5rnm.xat24cr.x1mh8g0r.x1vvkbs.xtlvy1s.x126k92a:last').text().replace(/^\s+|\s+$/gm,''));
var _class = _replace("x1lliihq x1k90msu x2h7rmj x1qfuztq xcza8v6 x1kpxq89 xsmyaan");

console.log(_class);
fs.writeFileSync('tmp2.txt', $(_class).text().replace(/^\s+|\s+$/gm,''));

function _replace(params) {
    return "."+params.replace(/ /g,".");
}
```

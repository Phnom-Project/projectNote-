### cheerio
#### replace and trim
```js
import * as cheerio from 'cheerio';
import * as fs from 'fs';

const buffer = fs.readFileSync('./fb.html');

const $ = cheerio.load(buffer);

//console.log($('.x11i5rnm.xat24cr.x1mh8g0r.x1vvkbs.xtlvy1s.x126k92a').text());

//fs.writeFileSync('tmp2.txt', $('.x11i5rnm.xat24cr.x1mh8g0r.x1vvkbs.xtlvy1s.x126k92a:last').text().replace(/^\s+|\s+$/gm,''));
var _class = _replace("x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz x1heor9g xt0b8zv xo1l8bm");

console.log(_class);
fs.writeFileSync('tmp2.txt', $(_class+" span").text().replace(/^\s+|\s+$/gm,''));

function _replace(params) {
    return "."+params.replace(/ /g,".");
}
```

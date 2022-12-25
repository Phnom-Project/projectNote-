##### dependency-check
##### Use SafeFrame
JavaScript code loaded inside an iframe (inline frame) cannot access the DOM of the containing page. HTML5 adds even more granular controls by adding the sandbox attribute to the <iframe>tag
```html
<iframe></iframe>
```

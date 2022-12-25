#### dependency-check
#### Use SafeFrame
JavaScript code loaded inside an iframe (inline frame) cannot access the DOM of the containing page. HTML5 adds even more granular controls by adding the sandbox attribute to the <iframe>tag
```html
<iframe></iframe>
```
> 💡 
  > A header that tells the browser never to host your website in a frame, Implementing this policy tells the browser to never put your website in a frame.
  ```
  Content-Security-Policy: frame-ancestors 'none'
  ```
  > A header that permits a site to host iframes of itself, to use the keyword self to permit your site to host iframes pointing to other parts of the same site
  ```
  Content-Security-Policy: frame-ancestors 'self'
  ```
  > if you need third-party websites to be able to host your site in a frame, you can whitelist individual web domains,
  ```
  Content-Security-Policy: frame-ancestors example.com google.com
  ```

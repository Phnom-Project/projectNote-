### embed image
```xml
<svg xmlns="http://www.w3.org/2000/svg"
     xmlns:xlink="http://www.w3.org/1999/xlink">

    ...
    <image
        width="100" height="100"
        xlink:href="data:image/png;base64,IMAGE_DATA"
        />
    ...
</svg>
```
### import external js to svg
```xml
<svg version="1.1"
     width="300" height="200"
     xmlns="http://www.w3.org/2000/svg"
     xmlns:xlink="http://www.w3.org/1999/xlink">

  <circle cx="40" cy="40" r="40" fill="red"/>
  <circle cx="80" cy="40" r="40" fill="green"/>
  <circle cx="60" cy="80" r="40" fill="blue"/>
  <script xlink:href="test.js" />

</svg>
```

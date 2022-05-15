### Title
- `1Form`
#### 1Form
- 1get data from GForm
> 1get data from GForm
```js
function formResponsesToArray() {
  var app = FormApp.openById(...),
  responses = app.getResponses(), stringResponses = []
  responses.forEach(function(r) {
    var response = []
    r.getItemResponses().forEach(function(i) {
      response.push(i.getResponse())
    })
    stringResponses.push(response)
  })
  Logger.log(stringResponses)
}
```

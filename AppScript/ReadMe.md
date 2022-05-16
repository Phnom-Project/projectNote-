### Title
- `1Form`
- `2Sheet`
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
#### 2Sheet
> 1load html file to sidebar
```js
function loadForm() {
  const htmlForSidebar = HtmlService.createTemplateFromFile("uiForm");
  const htmlOutput = htmlForSidebar.evaluate();
  const ui = SpreadsheetApp.getUi();
  ui.showSidebar(htmlOutput);
}
```

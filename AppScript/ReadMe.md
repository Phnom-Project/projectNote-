### Title
- `1Form`
- `2Sheet`
#### 1Form
- 1get data from GForm
> 1get data from GForm
```js
function formResponsesToArray() {
  var form = FormApp.openById(...),
  var responses = form.getResponses(), stringResponses = []
  responses.forEach(function (r) {
    var response = [];
    r.getItemResponses().forEach(function (i) {
      response.push(i.getResponse())
    })
    stringResponses.push(response)
  });
  stringResponses = stringResponses.reduce(function (e) {
    return stringResponses[3];
  })
  Logger.log('1' + stringResponses);
  // sheet.appendRow([stringResponses[0][0],stringResponses[0][1]]);
  var x = stringResponses[0][0];
  var x1 = stringResponses[1][0];
  Logger.log(x + " , " + x1)
  sheet.appendRow([x, x1, 1]);
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

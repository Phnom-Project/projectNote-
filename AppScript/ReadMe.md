# Note
1. **App Script**:
    1. which cell that have ever input DateTime type when we use it again by input number ,it will consider this number DateTime too.
2. **column** array =
    1. [[A1,B1,C1],[A2,B2,C2]]
3. **row** array = 
    1. [[A1],
    2. [A2],
    3. [A3]]
4. **'Z'<'z'** return **true**
### Title
- `1Form`
- `2Sheet`
- `3Calendar`
#### 1Form
- 1get data from GForm
> 1get data from GForm `🟡 warning : multiple choice is array`
```js
function onFormSubmit(event) {
  record_array = []
  var form = FormApp.getActiveForm(); // Form ID
  var formResponses = form.getResponses();
  var formCount = formResponses.length;

  var formResponse = formResponses[formCount - 1];
  var itemResponses = formResponse.getItemResponses();

  for (var j = 0; j < itemResponses.length; j++) {
  var itemResponse = itemResponses[j];
    var title = itemResponse.getItem().getTitle();
    var answer = itemResponse.getResponse();

    Logger.log(title);
    Logger.log(answer);

    record_array.push(answer[0]); //🟡 for first of multiple choice
  }
  AddRecord(record_array[0], record_array[1], record_array[2]);
}

function AddRecord(first_name, last_name, color) {
  var url = '';   //URL OF GOOGLE SHEET;
  var ss= SpreadsheetApp.openById(url);
  var dataSheet = ss.getSheetByName("123");
  dataSheet.appendRow([first_name, last_name, color, new Date()]);
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
#### 3Calendar
```js
function workWithcalendar(){
  var ss = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('123');
  var cal = CalendarApp.getCalendarById("[id]");
  var event = cal.createEvent("birdware",new Date("05/19/2022 12:00 AM"),new Date("05/19/2022 12:00 PM"));
}

function read4Calendar(){
  var cal = CalendarApp.getCalendarById("[id]");
  var event = cal.getEvents(new Date("05/19/2022 12:00 AM"),new Date("05/19/2022 12:00 PM"));
  //read
  for(var i = 0;i<event.length;i++){
    Logger.log(event);
    Logger.log(event[i].getTitle());
  }
  //delete
  for(var i = 0;i<event.length;i++){
    Logger.log(event[i].getTitle());
    Logger.log(event[i].deleteEvent());
  } 
}
```

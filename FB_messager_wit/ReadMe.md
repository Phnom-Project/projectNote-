### Restapi
> wehook authorization
```py
# get method 
hub.mode
hub.verify_token
hub.challenge #must return in integer data type
```
```js
// app.post('/webhook', (req, res) => {
//    let body = req.body;
//    console.log(body);
{
   object: 'page',
   entry: [
     { id: '100650141889360', time: 1643294940163, messaging: [Array] }
   ]
 }

// body.entry.forEach(function(entry) {
//    let webhookEvent = entry.messaging[0];
//    console.log(webhookEvent);
 {
   sender: { id: '5031209136912719' },
   recipient: { id: '100650141889360' },
   timestamp: 1643294939822,
   message: {
     mid: 'm_***************',
     text: 'ទីតាំង',
     nlp: { entities: [Object], detected_locales: [Array] }
   }
 }
 
 //   let senderPsid = webhookEvent.sender.id;
 //   console.log('Sender PSID: ' + senderPsid);
 Sender PSID: 5031209136912719

//    console.log(webhookEvent.message.nlp.entities);
 {
   intent: [ { confidence: 0.97514204549621, value: 'ask_location' } ],
   location: [ { confidence: 1, value: 'ទីតាំង', type: 'value' } ]
 }
```

### IndexedDB
#### Blob
```js
// Create an example Blob object
var blob = new Blob(['blob object'], {type: 'text/plain'});
try {
    var store = db.transaction(['entries'], 'readwrite').objectStore('entries');

    // Store the object  
    var req = store.put(blob, 'blob');
    req.onerror = function(e) {
        console.log(e);
    };
    req.onsuccess = function(event) {
        console.log('Successfully stored a blob as Blob.');
    };
} catch (e) {
    var reader = new FileReader();
    reader.onload = function(event) {
        // After exception, you have to start over from getting transaction.
        var store = db.transaction(['entries'], 'readwrite').objectStore('entries');

        // Obtain DataURL string
        var data = event.target.result;
        var req = store.put(data, 'blob');
        req.onerror = function(e) {
            console.log(e);
        };
        req.onsuccess = function(event) {
            console.log('Successfully stored a blob as String.');
        };
    };
    // Convert Blob into DataURL string
    reader.readAsDataURL(blob);
}
```

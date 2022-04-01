#### file i/o 
> absolute path of folder (linux and window)
```py
import os
def path():
    return os.path.dirname(os.path.abspath(__file__))+'/res/intent.json'
```
> write
- > object -> dict    array -> list
```py
//cd app and then run main.py
data = {
    "president": {
        "name": "Zaphod Beeblebrox",
        "species": "Betelgeusian"
    }
}
with open("data_file.json", "w") as write_file:
    json.dump(data, write_file)
```
> read
```py
cd app and then run main.py
with open("data_file.json", "r") as read_file:
    data = json.load(read_file)
```
#### import json
- dump**s**()	encoding to JSON objects
- dump()	encoded string writing on file
- load**s**()	Decode the JSON string
- load()	Decode while JSON file read
#### import Another file
```py
# from app.[fileName] import [def_Name] as xx
from [fileName] import [def_Name] as xx
from [folderName].[fileName] import [def_Name] as xx
import [folderName].[fileName] as x1
```

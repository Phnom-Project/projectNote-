#### file i/o
> write
> object -> dict    array -> list
```py
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
with open("data_file.json", "r") as read_file:
    data = json.load(read_file)
```

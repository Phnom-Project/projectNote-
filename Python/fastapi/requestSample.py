import requests
import json
url = "http://127.0.0.1:8080/items"
payload = json.dumps({
  "name": "Foo",
  "description": "An optional description",
  "price": 45.2,
  "tax": 3.5
})
headers = {
  'Content-Type': 'application/json'
}
response = requests.request("POST", url, headers=headers, data=payload)
print(response.content)

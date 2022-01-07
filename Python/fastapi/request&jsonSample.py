import requests
import json
from typing import Optional
from fastapi import FastAPI, params
from pydantic import BaseModel
from pydantic.types import Json
class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None
app = FastAPI()

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
@app.get("/items")
async def getItem():
    response = requests.request("POST", url, headers=headers, data=payload,params={"q":"home"})
    return(json.loads(response.content))
  # print(json.loads(response.content)['name'])

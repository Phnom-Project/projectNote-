from fastapi import FastAPI,Request

app = FastAPI()

@app.get("/items")
async def read_item(request: Request):
    params = request.query_params
    print(params)
    return params
@app.post("/items")
async def post_item(info: Request):
    req_info = await info.json()
    return {
        "status" : "SUCCESS",
        "data" : req_info
    }

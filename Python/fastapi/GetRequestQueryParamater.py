from fastapi import FastAPI,Request

app = FastAPI()

@app.get("/items/")

async def read_item(request: Request):
    params = request.query_params
    return params

#### Fastapi
>**app**
> app/main.py
```py
from typing import Optional
from fastapi import FastAPI
app = FastAPI()
@app.get("/")
def read_root():
    return {"Hello": "World"}
@app.get("/items/{item_id}")
def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}
```
> requirements.txt
```txt
fastapi
pydantic
uvicorn
```
> Dockerfile
```dockerfile
FROM alpine:latest

# Install python and pip
RUN apk add --no-cache --update python3 py3-pip bash
ADD ./requirements.txt /app/requirements.txt

# Install dependencies
RUN pip3 install --no-cache-dir -q -r /app/requirements.txt

# Add our code
ADD ./app /code/app
WORKDIR /code

# Expose is NOT supported by Heroku
# EXPOSE 5000 		

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
```

#### Docker
```ps
docker build -t [name] .
docker run -p 8080:80 [imageName]
```
> Dockerfile
```Dockerfile
FROM python:3.9
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./app /code/app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
```

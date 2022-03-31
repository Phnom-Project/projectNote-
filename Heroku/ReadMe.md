### Initialization
```shell
cd my-project/
git init
heroku git:remote -a pythoneyebird
git add .
git commit -am "make it better"
git push heroku master
```
### Docker
```shell
heroku login (if not authorization)

heroku container:login
[git clone https://github.com/heroku/alpinehelloworld.git]

// OR clone existing project first
[heroku container:push web -a safe-journey-95261]
heroku create

heroku container:push web   //Build the image and push to Container Registry
heroku container:release web    //Then release the image to your app:
```
> Dockerfile
```dockerfile
# FROM python:3.9-al
# WORKDIR /code
# COPY ./requirements.txt /code/requirements.txt
# RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
# COPY ./app /code/app
# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]

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
# CMD ["uvicorn", "app.main:app", "--host", "::"]
CMD uvicorn app.main:app --host 0.0.0.0 --port $PORT
```

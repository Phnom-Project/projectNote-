## summary
- 1Docker
  - python (dockerfile)
  - asp.net core (dockerfile)
### Initialization
```shell
cd my-project/
git init
heroku git:remote -a pythoneyebird
git add .
git commit -am "make it better"
git push heroku master
```
### 1Docker
```shell
// open Docker Desktop first
heroku login    //if not authorization

heroku container:login
[git clone https://github.com/heroku/alpinehelloworld.git]

// OR clone existing project first
[heroku container:push web -a safe-journey-95261]
heroku create

heroku container:push web   //Build the image and push to Container Registry
heroku container:release web    //Then release the image to your app:
```
##### Python
> Dockerfile (Python)
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
##### Asp.net core
```shell
heroku auth:login
heroku container:login
heroku container:push web --app [name]
heroku container:release web --app [name]
```
> Dockerfile (asp.net core)
> - dockerfile (out of project)
> - appnetapp/
```dockerfile
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.sln .
COPY aspnetapp/*.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY aspnetapp/. .
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/sdk:6.0
WORKDIR /app
COPY --from=build-env /app/out .

# Run the app on container startup
# Use your project name for the second parameter
# e.g. MyProject.dll
# ENTRYPOINT [ "dotnet", "aspnetapp.dll" ]
CMD ASPNETCORE_URLS=http://*:$PORT dotnet aspnetapp.dll
```

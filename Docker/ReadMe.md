### asp.net core after publish
```
FROM mcr.microsoft.com/dotnet/sdk:6.0
COPY ./output /publish
WORKDIR /publish

EXPOSE 5175
ENTRYPOINT ["dotnet", "WeatherForecastAPI.dll"]
```
### build small image
```dockerfile
FROM node:8 as build

WORKDIR /app
COPY package.json index.js ./
RUN npm install

FROM node:8-alpine

COPY --from=build /app /
EXPOSE 3000
CMD ["npm", "start"]
```
> enviroment
```dockerfile
FROM ubuntu                                                                                                            
ARG BUILD_TIME=abc     # for built time                                                                                                
ENV RUN_TIME=123       # for runtime                                                                                               
RUN touch /env.txt                                                                                                     
RUN printenv > /env.txt
```
### doker cmd
```shell
docker build -t good .
docker run -d -p 8080:80 --name abc good
///for visual code
docker run -it --name playwrigthDotnet -p 2200:22 -d mcr.microsoft.com/playwright/dotnet:latest
////edit file with copy and paste in VS code
cat > program.cs
////  download file from container
docker cp [containerName]:/PlaywrightDemo/screenshot.png .
```

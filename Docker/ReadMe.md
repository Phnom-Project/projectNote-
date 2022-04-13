#### build small image
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
#### doker cmd
```shell
docker build -t good .
```

### install package
```go
go get github.com/gin-gonic/gin@v1.7.4
```
### module
```go
go mod init {companyName/projectName} OR go mod init {projectName}
```
### deploy to docker
```dockerfile
FROM golang:alpine
RUN mkdir /app
WORKDIR /app
ADD go.mod .
ADD go.sum .
RUN go mod download
ADD . .
RUN go get github.com/githubnemo/CompileDaemon
EXPOSE 8000
ENTRYPOINT CompileDaemon --build="go build main.go" --command=./main
```
### import local package "hello"
```go
package main
import (
	"birdware/hello" // from hello folder with "package hello" in all {sub_file}.go
)
func main() {
	hello.SayHello()
	hello.SayWorld()
}
```

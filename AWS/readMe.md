### Lambda 
#### Container Image (need S3_bucket, ECR, lamda)
```shell
dotnet new ".NET 6" --list --tag Lambda
//The deployment tool needs an S3 bucket to store its template
aws s3api create-bucket --bucket cloudformation-templates-2022
//Start Docker
//create asp.net core project
dotnet new serverless.image.AspNetCoreWebAPI --name AspNet6ContainerWebApi
//Deploy
dotnet lambda deploy-serverless --stack-name AspNet6ContainerWebApi --s3-bucket cloudformation-templates-2022

```

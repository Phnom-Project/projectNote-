### minio
```ps1
# download
Invoke-WebRequest -Uri "https://dl.min.io/server/minio/release/windows-amd64/minio.exe" -OutFile "C:\minio.exe"
# setup
setx MINIO_ROOT_USER admin
setx MINIO_ROOT_PASSWORD password
# run
E:\3ytest\1DB_minio\minio.exe server E:\3ytest\1DB_minio\Data --console-address ":9001"
# or in windows
./minio.exe server E:\3ytest\1DB_minio\Data --console-address ":9001"
```
## s5cmd (window)
> (file) your-credentials-file
```
[default]
aws_access_key_id = a0H1zKekXk8dOMTAJbAO
aws_secret_access_key = hEYNnc7h3PyGOy50XwZcARbHLlpX8EKdUpzMmoUb
```
```ps1
# list
./s5cmd --endpoint-url=http://localhost:9000 --credentials-file ./your-credentials-file --profile default ls s3://image/
```
- ### aws
  - AWS_REGION environment variable. (ex: ap-southeast-1)
```ps1
# verify
$Env:aws_region
# list
./s5cmd --endpoint-url=https://s3.ap-southeast-1.amazonaws.com --credentials-file ./your-credentials-file --profile default ls s3://bucketname/
```
### synchronization
```ps1
# sync (restore) : source to destination
./s5cmd --endpoint-url=http://localhost:9000 --credentials-file ./your-credentials-file --profile default sync ./12_june_2024 s3://image/
# sync (backup) : from destination to source
./s5cmd --endpoint-url=http://localhost:9000 --credentials-file ./your-credentials-file --profile default sync s3://image/* ./12_june_2024
```
### download
```ps1
# Download a single S3 object
s5cmd cp s3://bucket/object.gz .
# Download multiple S3 objects
s5cmd cp 's3://bucket/logs/2020/03/*' logs/
```
### upload
```ps1
# Upload a single S3 object
s5cmd cp object.gz s3://bucket/
# Upload multiple S3 objects    
s5cmd cp directory/ s3://bucket/
```

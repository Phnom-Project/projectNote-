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

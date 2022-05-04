### 3Mongodb
- > connecting string with certificate (ssl)
- > mongosh "[connecting string]"
```
mongodb+srv://userID:password@host/database?authSource=admin&replicaSet=<---->&tls=true&tlsCAFile=C%3A%5CUsers%5CDownloads%5C123.crt
```
### 2support rang ip address in trusted source
> 10.10.0.0/16
### 1asp.net core
> postgresql 
> - %appdata%/postgresql/postgresql.crt   (window)
> - ~/.postgresql/postgresql.crt   (linux)
```sql
Server=127.0.0.1;Database=myDataBase;Userid=myUsername;Password=myPassword;Integrated Security=true;Pooling=true;Trust Server Certificate=true;SslMode=Require;
```

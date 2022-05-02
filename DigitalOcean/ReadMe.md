### 2support rang ip address in trusted source
> 10.10.0.0/16
### 1asp.net core
> postgresql 
> - %appdata%/postgresql/postgresql.crt   (window)
> - ~/.postgresql/postgresql.crt   (linux)
```sql
Server=127.0.0.1;Database=myDataBase;Userid=myUsername;Password=myPassword;Integrated Security=true;Pooling=true;Trust Server Certificate=true;SslMode=Require;
```

#### for this we use `postgresql DB` also we must to add this nuget package
- [x] <PackageReference Include="Npgsql.EntityFrameworkCore.PostgreSQL" Version="" />
```
- [x] <PackageReference Include="Npgsql.EntityFrameworkCore.PostgreSQL" Version="" />
<PackageReference Include="Npgsql.EntityFrameworkCore.PostgreSQL.Design" Version="" />

<PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="">....</PackageReference>
```
> startup.cs > ConfigureServices(IServiceCollection services)
```
services.AddDbContext<ApplicationDbContext>(options =>
            options.UseNpgsql(Configuration.GetConnectionString("Postgresql")));
```
> appsetting.json
```
"ConnectionStrings": {
    "Postgresql": "User ID=postgres;Password=@dmin123;Host=127.0.0.1;Port=5432;Database=identity;Pooling=true;Connection Lifetime=0;"
  },
```
#### `visual studio` migration
```
Add-Migration InitialCreate
Update-Database
```

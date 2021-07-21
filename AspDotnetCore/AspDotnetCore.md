#### for this we use `postgresql DB` also we must to add this nuget package
```
<PackageReference Include="Npgsql.EntityFrameworkCore.PostgreSQL" Version="" />
<PackageReference Include="Npgsql.EntityFrameworkCore.PostgreSQL.Design" Version="" />

<PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="">....</PackageReference>
```
> startup.cs
```
services.AddDbContext<ApplicationDbContext>(options =>
            options.UseNpgsql(Configuration.GetConnectionString("Postgresql")));
```
#### `visual studio` migration
```
Add-Migration InitialCreate
Update-Database
```

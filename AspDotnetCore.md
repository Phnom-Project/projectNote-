#### for this we use `postgresql DB` also we must to add this nuget package
~~PackageReference Include="Microsoft.EntityFrameworkCore" Version=""
PackageReference Include="Microsoft.EntityFrameworkCore.Design" Version= ""~~
```
<PackageReference Include="Npgsql.EntityFrameworkCore.PostgreSQL" Version="" />
<PackageReference Include="Npgsql.EntityFrameworkCore.PostgreSQL.Design" Version="" />

<PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="">....</PackageReference>
```
#### `visual studio` migration
```
Add-Migration InitialCreate
Update-Database
```
~~PackageReference Include="Microsoft.EntityFrameworkCore" Version=""
PackageReference Include="Microsoft.EntityFrameworkCore.Design" Version= ""~~

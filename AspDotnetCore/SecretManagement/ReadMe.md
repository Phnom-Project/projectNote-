### Secret
-  linux path
   - ~/.microsoft/usersecrets/<user_secrets_id>/secrets.json
- window path
   - %APPDATA%\Microsoft\UserSecrets\<user_secrets_id>\secrets.json
```shell
dotnet user-secrets init
```
```xml
<PropertyGroup>
  <TargetFramework>netcoreapp3.1</TargetFramework>
  <UserSecretsId>79a3edd0-2092-40a2-a04d-dcb46d5ca9ed</UserSecretsId>
</PropertyGroup>
```
```shell
dotnet user-secrets set "Movies:ServiceApiKey" "12345"
```
> secret.json
```json
{
  "Movies:ServiceApiKey": "12345"
}
```
- set specific project
```shell
dotnet user-secrets set "Movies:ServiceApiKey" "12345" --project "C:\apps\WebApp1\src\WebApp1"
``` 
### Access Secret
```cs
var builder = WebApplication.CreateBuilder(args);
var movieApiKey = builder.Configuration["Movies:ServiceApiKey"];
var app = builder.Build();
app.MapGet("/", () => movieApiKey);
app.Run();
///// OR
public class IndexModel : PageModel
{
    private readonly IConfiguration _config;
    public IndexModel(IConfiguration config)
    {
        _config = config;
    }
    public void OnGet()
    {
        var moviesApiKey = _config["Movies:ServiceApiKey"];
    }
}
```
### Set multiple secrets
- linux
```shell
cat ./input.json | dotnet user-secrets set
```
- window
```shell
 type .\input.json | dotnet user-secrets set
```

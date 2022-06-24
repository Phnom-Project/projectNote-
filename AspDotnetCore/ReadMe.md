## Title
- 7custom favicon
- 6Interop Static page
- 5Crytography
- 4MudBlazor
- 3hot Reload
- 2blazor wasm
- 1load resource from wwwroot
#### 7custom favicon
> _Layout.cshtml
```
<head>
    ...
    <link rel="icon" type="image/x-icon" href="~/asset.ico">
    ...
</head>
```
#### 6Interop Static page
> Assume you have put the index.html within the wwwroot/ folder, you could achieve that by registering a DefaultFiles middleware:
> Program.cs
```cs
// for Home page , ex : https://localhost:7196/
app.UseDefaultFiles();    // add this line before invoking app.UseStaticFiles();
app.UseStaticFiles();
...
```
> (Note the order of middlewares is important)
> Or if you want to put index.html within a different location, you could pass a custom FileProvider (e.g. PhysicalFileProvider). For more details, see official docs.
 ```cs
 // for static file , ex : https://localhost:7196/youtube/index.html
 using Microsoft.Extensions.FileProviders;
 ...
 app.UseStaticFiles(new StaticFileOptions()
    {
        FileProvider = new PhysicalFileProvider(
            Path.Combine(Directory.GetCurrentDirectory(), @"wwwroot\Home")),
        RequestPath = new PathString("/youtube")
    });
 ```
#### 5Crytography
```cs
//<PackageReference Include="BCrypt.Net-Next" Version="4.0.2" />
using BCrypt.Net;
string passwordHash = BCrypt.Net.BCrypt.HashPassword("Pa$$w0rd");
bool verified = BCrypt.Net.BCrypt.Verify("Pa$$w0rd", passwordHash);
```
#### 4MudBlazor
```shell
dotnet new mudblazor --host server --name birdware
```
#### ⚡3hot Reload
```shell
dotnet watch
```
#### 2blazor wasm 
> 💡 virtual folder  can share file folder and file **(if not refresh F5)**
#### 1load resource from wwwroot
```c#
private WeatherForecast[] forecasts;
protected override async Task OnInitializedAsync()
  {
      forecasts = await Http.GetFromJsonAsync<WeatherForecast[]>("sample-data/weather.json");
  }
```

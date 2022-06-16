## Title
- 5Crytography
- 4MudBlazor
- 3hot Reload
- 2blazor wasm
- 1load resource from wwwroot
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

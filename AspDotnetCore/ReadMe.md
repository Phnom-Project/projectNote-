#### MudBlazor
```shell
dotnet new mudblazor --host server --name birdware
```
#### ⚡hot Reload
```shell
dotnet watch
```
#### blazor wasm 
> 💡 virtual folder  can share file folder and file **(if not refresh F5)**
#### load resource from wwwroot
```c#
private WeatherForecast[] forecasts;
protected override async Task OnInitializedAsync()
  {
      forecasts = await Http.GetFromJsonAsync<WeatherForecast[]>("sample-data/weather.json");
  }
```

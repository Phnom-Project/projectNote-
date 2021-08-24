### LazyLoadAssembly
> projectName.csproj
```xml
<ItemGroup>
   <ProjectReference Include="..\CounterHelper\CounterHelper.csproj" />
</ItemGroup>	
<ItemGroup>
	<BlazorWebAssemblyLazyLoad Include="CounterHelper.dll"/>
</ItemGroup>
```
> App.razor
```c#
@using System.Reflection
@using Microsoft.AspNetCore.Components.WebAssembly.Services
@inject LazyAssemblyLoader AssemblyLoader

<Router AppAssembly="@typeof(Program).Assembly" PreferExactMatches="@true"
        OnNavigateAsync="OnNavigateAsync"
        AdditionalAssemblies="_lazyLoadedAssemblies">
    <Found Context="routeData">
        <RouteView RouteData="@routeData" DefaultLayout="@typeof(MainLayout)" />
    </Found>
    <NotFound>
        <LayoutView Layout="@typeof(MainLayout)">
            <p>Sorry, there's nothing at this address.</p>
        </LayoutView>
    </NotFound>
    <Navigating>
        <p>Loading the page...</p>
    </Navigating>
</Router>
@code
{
    private List<Assembly> _lazyLoadedAssemblies = new List<Assembly>();
    private async Task OnNavigateAsync(NavigationContext context)
    {
        if (context.Path == "counter")
        {
            var assemblies = await AssemblyLoader.LoadAssembliesAsync(new[] { "CounterHelper.dll" });
            _lazyLoadedAssemblies.AddRange(assemblies);
        }
    }
}
```

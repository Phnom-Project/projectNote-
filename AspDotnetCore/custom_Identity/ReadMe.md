### Authorize
> TestAuthStateProvider.cs
```cs
using Microsoft.AspNetCore.Components.Authorization;
using System.Security.Claims;

namespace BlazorApp.Models
{
    public class TestAuthStateProvider : AuthenticationStateProvider
    {
        public async override Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, "John Doe"),
                new Claim(ClaimTypes.Role, "Administrator")
            };
            var anonymous = new ClaimsIdentity(claims, "testAuthType");
            // var anonymous = new ClaimsIdentity();
            return await Task.FromResult(new AuthenticationState(new ClaimsPrincipal(anonymous)));
        }
    }
}
```
> Program.cs
```cs
..
builder.Services.AddAuthorizationCore();
builder.Services.AddScoped<AuthenticationStateProvider, TestAuthStateProvider>();
..
```
> App.razor
```razor
<CascadingAuthenticationState>
    <Router AppAssembly="@typeof(App).Assembly">
        <Found Context="routeData">
            <AuthorizeRouteView RouteData="@routeData" DefaultLayout="@typeof(MainLayout)">
                <Authorizing>
                    <text> Please wait, we are authorizing the user. </text>
                </Authorizing>
                <NotAuthorized>
                    <text> You are not authorized to access this page. </text>
                </NotAuthorized>
            </AuthorizeRouteView>
            <FocusOnNavigate RouteData="@routeData" Selector="h1" />
        </Found>
        <NotFound>
            <PageTitle>Not found</PageTitle>
            <LayoutView Layout="@typeof(MainLayout)">
                <p role="alert">Sorry, there's nothing at this address.</p>
            </LayoutView>
        </NotFound>
    </Router>
</CascadingAuthenticationState>
```
> index.razor
```razor
@page "/"
@using System.Security.Claims
<AuthorizeView Roles="Administrators">
    <Authorized>
        The user: @(context.User.FindFirst(ClaimTypes.Name)).Value is authorized
    </Authorized>
    <NotAuthorized>
        The User is not authorized
    </NotAuthorized>
</AuthorizeView>
```

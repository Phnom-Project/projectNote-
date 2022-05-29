### Authentication with Mock
> Auth/CustomAuthenticationProvider.cs
```cs
using Microsoft.AspNetCore.Components.Authorization;
using System.Security.Claims;

namespace BlazorAuth.Auth
{
    public class CustomAuthenticationProvider : AuthenticationStateProvider
    {
        private ClaimsPrincipal claimsPrincipal = new ClaimsPrincipal(new ClaimsIdentity());
        public override async Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            await Task.FromResult(0);
            return new AuthenticationState(claimsPrincipal);
        }
        public void LoginNotify()
        {
            var identity = new ClaimsIdentity(new[]
            {
            new Claim(ClaimTypes.Name, "Test"),
            new Claim(ClaimTypes.Email, "test@test.com")
            }, "Fake Authentication");
            claimsPrincipal = new ClaimsPrincipal(identity);
            NotifyAuthenticationStateChanged(GetAuthenticationStateAsync());
        }
        public void LogoutNotify()
        {
            var anonymous = new ClaimsPrincipal(new ClaimsIdentity());
            claimsPrincipal = anonymous;
            NotifyAuthenticationStateChanged(GetAuthenticationStateAsync());
        }
    }
}
```
> Service/IAccountSerive.cs
```cs
namespace BlazorAuth.Service
{
    public interface IAccountService
    {
        bool Login();
        bool Logout();
    }
}
```
> Service/AccountService.cs
```cs
using Microsoft.AspNetCore.Components.Authorization;
using BlazorAuth.Auth;

namespace BlazorAuth.Service
{
    public class AccountService : IAccountService
    {
        private readonly AuthenticationStateProvider _authenticationStateProvider;

        public AccountService(AuthenticationStateProvider authenticationStateProvider)
        {
            _authenticationStateProvider = authenticationStateProvider;
        }
        public bool Login()
        {
            (_authenticationStateProvider as CustomAuthenticationProvider).LoginNotify();
            return true;
        }

        public bool Logout()
        {
            (_authenticationStateProvider as CustomAuthenticationProvider).LogoutNotify();
            return true;
        }
    }
}
```
> Pages/Index.razor
```razor
@page "/"
@inject IAccountService _accountService;
<div>
    <AuthorizeView>
        <Authorized>
            <h1>Your Dashboard - Your Claims</h1>
            <div>
                @foreach (var claim in userClaim)
                {
                    <div>@claim.Type - @claim.Value</div>
                }
            </div>
            <div>
                <button type="button" class="btn btn-primary"  @onclick="Logout">Logout</button>
            </div>
        </Authorized>
        <NotAuthorized>
            <h1>!Oops you need to be login to view your dashboard</h1>
            <button type="button" class="btn btn-primary"  @onclick="Login">Login</button>
        </NotAuthorized>
    </AuthorizeView>
</div>
@code{ 
    [CascadingParameter]
    private Task<AuthenticationState> authenticationState { get; set; }
    private IList<Claim> userClaim
    {
        get
        {
            var auth =  authenticationState.Result;
            if (auth.User.Identity.IsAuthenticated)
            {
                return auth.User.Claims.ToList();
            }
            return new List<Claim>();
        }
    }
    private async Task Login()
    {
        _accountService.Login();
    }
 
    private void Logout()
    {
        _accountService.Logout();
    }
}
```
> App.razor
```razor
<CascadingAuthenticationState>
    <Router AppAssembly="@typeof(App).Assembly">
        <Found Context="routeData">
            <RouteView RouteData="@routeData" DefaultLayout="@typeof(MainLayout)" />
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

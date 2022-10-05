### Playwright
```shell
dotnet add package Microsoft.Playwright
dotnet build
# for miss assembly downgrade version Microsoft.Playwright 1.25.0
```
> Program.cs
```cs
using Microsoft.Playwright;

using var playwright = await Playwright.CreateAsync();
await using var browser = await playwright.Chromium.LaunchAsync();
var page = await browser.NewPageAsync();
await page.GotoAsync("https://playwright.dev/dotnet");
await page.ScreenshotAsync(new()
{
    Path = "screenshot.png"
});
```

# Custom Configuration

> #### Model/
- > Models.cs
```cs
namespace CustomProvider.Models;
public record Settings(string Id, string Value);

```
> #### Example/
- > WidgetOptions.cs
```cs
namespace CustomProvider.Example;
public class WidgetOptions
{
    public required Guid EndpointId { get; set; }
    public required string DisplayLabel { get; set; } = null!;
    public required string WidgetRoute { get; set; } = null!;
}
```
> #### Provider/
- > EntityConfigurationContext.cs
```cs
using CustomProvider.Models;
using Microsoft.EntityFrameworkCore;
namespace CustomProvider.Providers;
public class EntityConfigurationContext : DbContext
{
    private readonly string _connectionString;
    public DbSet<Settings> Settings => Set<Settings>();
    public EntityConfigurationContext(string? connectionString) =>
        _connectionString = connectionString ?? "";
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        _ = _connectionString switch
        {
            { Length: > 0 } => optionsBuilder.UseSqlServer(_connectionString),
            _ => optionsBuilder.UseInMemoryDatabase("InMemoryDatabase")
        };
    }
}
```
- > EntityConfigurationProvider.cs
 ```cs
 using CustomProvider.Models;
using Microsoft.Extensions.Configuration;
namespace CustomProvider.Providers;
public class EntityConfigurationProvider : ConfigurationProvider
{
    private readonly string? _connectionString;
    public EntityConfigurationProvider(string? connectionString) =>
        _connectionString = connectionString;
    public override void Load()
    {
        // using var dbContext = new EntityConfigurationContext(_connectionString);
        // dbContext.Database.EnsureCreated();
        // Data = dbContext.Settings.Any()
        //     ? dbContext.Settings.ToDictionary<Settings, string, string?>(c => c.Id, c => c.Value, StringComparer.OrdinalIgnoreCase)
        //     : CreateAndSaveDefaultValues(dbContext);
        var settings = new Dictionary<string, string?>(
            StringComparer.OrdinalIgnoreCase)
        {
            ["WidgetOptions:EndpointId"] = "b3da3c4c-9c4e-4411-bc4d-609e2dcc5c67",
            ["WidgetOptions:DisplayLabel"] = "Widgets Incorporated, LLC.",
            ["WidgetOptions:WidgetRoute"] = "api/love for your"
        };
        Data = settings;
    }
    static IDictionary<string, string?> CreateAndSaveDefaultValues(
        EntityConfigurationContext context)
    {
        var settings = new Dictionary<string, string?>(
            StringComparer.OrdinalIgnoreCase)
        {
            ["WidgetOptions:EndpointId"] = "b3da3c4c-9c4e-4411-bc4d-609e2dcc5c67",
            ["WidgetOptions:DisplayLabel"] = "Widgets Incorporated, LLC.",
            ["WidgetOptions:WidgetRoute"] = "api/widgets"
        };
        context.Settings.AddRange(
            settings.Select(kvp => new Settings(kvp.Key, kvp.Value))
                    .ToArray());
        context.SaveChanges();
        return settings;
    }
}
 ```
 - > EntityConfigurationSource.cs
```cs
using Microsoft.Extensions.Configuration;
namespace CustomProvider.Providers;
public class EntityConfigurationSource : IConfigurationSource
{
    private readonly string? _connectionString;
    public EntityConfigurationSource(string? connectionString) =>
        _connectionString = connectionString;
    public IConfigurationProvider Build(IConfigurationBuilder builder) =>
        new EntityConfigurationProvider(_connectionString);
}
```
> #### Extensions/
- > ConfigurationBuilderExtensions.cs
```cs
using CustomProvider.Example.Providers;
namespace Microsoft.Extensions.Configuration;
public static class ConfigurationBuilderExtensions
{
    public static IConfigurationBuilder AddEntityConfiguration(
        this IConfigurationBuilder builder)
    {
        var tempConfig = builder.Build();
        var connectionString =
            tempConfig.GetConnectionString("WidgetConnectionString");
        return builder.Add(new EntityConfigurationSource(connectionString));
    }
}
```
> ## Program.cs
```cs
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using CustomProvider.Example;
using IHost host = Host.CreateDefaultBuilder(args)
    .ConfigureAppConfiguration((_, configuration) =>
    {
        configuration.Sources.Clear();
        configuration.AddEntityConfiguration();
    })
    .ConfigureServices((context, services) =>
        services.Configure<WidgetOptions>(
            context.Configuration.GetSection("WidgetOptions")))
    .Build();
var options = host.Services.GetRequiredService<IOptions<WidgetOptions>>().Value;
Console.WriteLine($"DisplayLabel={options.DisplayLabel}");
Console.WriteLine($"EndpointId={options.EndpointId}");
Console.WriteLine($"WidgetRoute={options.WidgetRoute}");

await host.RunAsync();
// Sample output:
//    WidgetRoute=api/widgets
//    EndpointId=b3da3c4c-9c4e-4411-bc4d-609e2dcc5c67
//    DisplayLabel=Widgets Incorporated, LLC.
```

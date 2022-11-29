# Title
```diff
+ 3Reflection
+ 4run C# code from string
```
#### 5 String interpolation
```razor
Href= '@string.Format("/admin/post/{0}",@context.PostID)' 
Href="@($"/admin/post/{@context.PostID}")"
```
#### 4run C# code from string
```cs
using Microsoft.CodeAnalysis.CSharp.Scripting;
//you may need to import the namespace from NuGet packages [dotnet add package Microsoft.CodeAnalysis.CSharp.Scripting]
var now = CSharpScript.EvaluateAsync<string>("System.DateTime.Now.ToString()").Result;
// See https://aka.ms/new-console-template for more information
Console.WriteLine(now);

```
#### 3Reflection (.net 6)
> testlib/test.cs
```cs
namespace testlib;
public class test
{
    public string sayHello(string x)
    {
        return "hello" + x;
    }
}
```
> Auto/program.cs
```cs
using System.Reflection;
// See https://aka.ms/new-console-template for more information
Assembly? testAssembly = Assembly.LoadFile(@"E:\3ytest\c#\testlib\bin\Debug\net6.0\testlib.dll");
Type calcType = testAssembly.GetType("testlib.test");
Object? obj = Activator.CreateInstance(calcType);
var method = calcType.GetMethod("sayHello");
var result = method?.Invoke(obj, new Object[] { "home" });
Console.WriteLine(result);
Console.WriteLine("Hello, World!");
```
#### copy file to debug output directory
> project.csproj
```c#
<ItemGroup>
  <None Update="housing.csv">
    <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
  </None>
</ItemGroup>
```
#### download file 
```c#
WebClient client = new WebClient();
client.DownloadFile("https://raw.githubusercontent.com/jwood803/MLNetExamples/master/MLNetExamples/BinaryData/housing.csv",
    "housing23.csv");
Console.WriteLine("Done");
```


# Title
```diff
+ 3Reflection
+ 4run C# code from string
```
#### 7 Using Statement
        **using statement** is used for object having implement System.IDisposable or System.IAsyncDisposable, cleanup an object.
```cs
//Although the StreamReader class implements the IDisposable interface, which indicates that it uses an unmanaged resource, the example doesn't explicitly call the StreamReader.Dispose method
using System.IO;
class UsingDeclaration
{
    static void Main()
    {
        var buffer = new char[50];
        using StreamReader streamReader = new("file1.txt");
        int charsRead = 0;
        while (streamReader.Peek() != -1)
        {
            charsRead = streamReader.Read(buffer, 0, buffer.Length);
            // Process characters read.
        }
    }
}
```
#### 6 Byte[] to base64, base64 to byte[]
```cs
public void SaveToBase64File(){
        // string filePath = @"E:\1download\2image\cheatsheet.jpg";
        string filePath = @"WriteLines.jpg";
        byte[] source = File.ReadAllBytes(filePath);

        File.WriteAllText("File/WriteLines.txt", Convert.ToBase64String(source));
    }
    public void FromBase64ToFile(){
        string path = @"WriteLines.jpg";
        string source = File.ReadAllText("File/WriteLines.txt");
        File.WriteAllBytes("FileImage/WriteLines.jpg", Convert.FromBase64String(source));

    }
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

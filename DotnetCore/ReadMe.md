### copy file to debug output directory
> project.csproj
```c#
<ItemGroup>
  <None Update="housing.csv">
    <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
  </None>
</ItemGroup>
```
### download file 
```c#
WebClient client = new WebClient();
client.DownloadFile("https://raw.githubusercontent.com/jwood803/MLNetExamples/master/MLNetExamples/BinaryData/housing.csv",
    "housing23.csv");
Console.WriteLine("Done");
```

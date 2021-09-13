### copy file to debug output directory
> project.csproj
```c#
<ItemGroup>
  <None Update="housing.csv">
    <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
  </None>
</ItemGroup>
```

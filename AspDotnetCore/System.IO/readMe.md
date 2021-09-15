### download file
```c#

private static readonly HttpClient _httpClient = new HttpClient();
byte[] fileBytes = await _httpClient.GetByteArrayAsync(uri);
File.WriteAllBytes("path", fileBytes);
```

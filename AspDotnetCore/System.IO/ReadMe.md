### list directory
```c#
private string file = Directory.GetCurrentDirectory();
private string[] files = Directory.GetDirectories(Directory.GetCurrentDirectory());
```
### download file
```c#
string path = Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "/good.txt"
private static readonly HttpClient _httpClient = new HttpClient();
byte[] fileBytes = await _httpClient.GetByteArrayAsync(uri);
File.WriteAllBytes(path, fileBytes);
```
### write ,read file 
```c#
string path = Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "/good.txt";
private void WriteFile()
    {
        StreamWriter sw = new StreamWriter(path);
        sw.WriteLine("Hello World!!");
        sw.WriteLine("From the StreamWriter class");
        sw.Close();
    }
private void ReadFile()
    {
        try
        {
            StreamReader sr = new StreamReader(path);
            line = sr.ReadLine();
            while (line != null)
            {
                Console.WriteLine(line);
                line = sr.ReadLine();
            }
            sr.Close();
            Console.ReadLine();
        }
        catch (Exception e)
        {
            Console.WriteLine("Exception: " + e.Message);
        }
        finally
        {
            Console.WriteLine("Executing finally block.");
        }
    }
```

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
> json
```c#
var folderDetails = Path.Combine(Directory.GetCurrentDirectory(),
                    "wwwroot\\masterdata\\data.json");
var JSON = System.IO.File.ReadAllText(folderDetails);
                dynamic jsonObj = Newtonsoft.Json.JsonConvert.DeserializeObject(JSON);
                List<MasterData> _list = new List<MasterData>();
                foreach (var item in jsonObj["M203StructureKind"])
                {
                    var m203StructureKind = new MasterData
                    {
                        Code = item["Code"].ToString(),
                        Description = item["Description"].ToString(),
                    };
                    _list.Add(m203StructureKind);
                }
                return Ok(_list.ToArray());
```
> default
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

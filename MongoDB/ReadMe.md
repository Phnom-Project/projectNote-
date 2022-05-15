#### MongoDB Title
- 1connection
- 2list\<object\> to json
#### 2list\<object\> to json
```cs
List<Book> Document = collection.Find(_=>true).ToList();
foreach (var item in Document)
{
    var json = JsonSerializer.Serialize(item);
    Console.WriteLine(json);
}
```
#### 1connection
> Book.cs
```cs
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
namespace MongCsharp.Models;
public class Book
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string? Id { get; set; }
    [BsonElement("Name")]
    public string BookName { get; set; } = null!;
    public decimal Price { get; set; }
    public string Category { get; set; } = null!;
    public string Author { get; set; } = null!;
}
```
> program.cs
```cs
//.net 6
using MongoDB.Driver;
using MongCsharp.Models;
MongoClient dbClient = new MongoClient("mongodb://localhost:27017");
var dbList = dbClient.ListDatabases().ToList();
var database = dbClient.GetDatabase("bookstore");
var collection = database.GetCollection<Book>("Books");
var firstDocument = collection.Find(_=>true).FirstOrDefault().Author;
Console.WriteLine(firstDocument.ToString());
```

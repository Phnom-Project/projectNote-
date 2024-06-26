### Backup & Restore
    [backup all]
    mongodump --host 127.0.0.1:27017 
    [backup specific]
    mongodump --host 127.0.0.1:27017 --db "test"
    [restore all]
    mongorestore --host 127.0.0.1 --port 27017 ./dump
    [restore specify]
    mongorestore --host 127.0.0.1 --port 27017 --db test23  ./dump/test
```ps1
[backup]
mongodump --uri="mongodb+srv://username:password@cluster.tenant.mongodb.net/[collection_name]"
[restore]
mongorestore --uri="mongodb+srv://username:password@cluster.tenant.mongodb.net/database" dump/
mongorestore --uri="mongodb://localhost:27017/<DATABASE>" dump/car24
[To avoid sending my password in the command line history, I can do this instead:]
mongodump --uri mongodb+srv://<USER>@clustername.ajv83.mongodb.net/<DATABASE>
>> Enter password:
```
#### MongoDB Title
- 1connection
- 2list\<object\> to json
#### 3Upload & Download image
```cs
namespace MongoConsole;

using MongoDB.Bson;
using MongoDB.Driver;//<PackageReference Include="MongoDB.Driver" Version="2.18.0" />
using MongoDB.Driver.GridFS;//<PackageReference Include="MongoDB.Driver.GridFS" Version="2.18.0" />
public class MongoUtilities
{
    static IMongoClient dbClient = new MongoClient("mongodb://127.0.0.1:27017");
    static IMongoDatabase database = dbClient.GetDatabase("test");
    static IGridFSBucket bucket = new GridFSBucket(database, new GridFSBucketOptions
        {
            BucketName = "images",
            ChunkSizeBytes = 1048576, // 1MB
            WriteConcern = WriteConcern.WMajority,
            ReadPreference = ReadPreference.Secondary
        });
    internal static void upload()
    {
        // var bucket = new GridFSBucket(database);
        // bucket;

        string filePath = @"E:\1download\2image\cheatsheet.jpg";
        byte[] source = File.ReadAllBytes(filePath);
        var options = new GridFSUploadOptions
        {
            ChunkSizeBytes = 64512, // 63KB
        };
        var id = bucket.UploadFromBytes("filename", source, options);
        Console.Write(id);
    }
    internal void Download(){
        ObjectId id = new ObjectId("63835a33eb5203b8332629da");
        var bytes = bucket.DownloadAsBytes(id);
        // string lines = BitConverter.ToString(bytes).Replace("-", "").ToLower();
        File.WriteAllBytes("WriteLines.jpg", bytes);
        // Console.Write();
    }
}
```
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

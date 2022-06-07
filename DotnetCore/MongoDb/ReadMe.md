### Model
> Entities/Plant.cs
```cs
using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;

namespace Console.Entities;
public class Plant
{
    [BsonElement("_id")]
    public ObjectId Id { get; set; } = ObjectId.GenerateNewId();

    [BsonElement("name")]
    public string Name { get; set; }

    [BsonElement("sunlight")]
    [BsonRepresentation(BsonType.String)]
    public string Sunlight { get; set; }

    [BsonElement("color")]
    [BsonRepresentation(BsonType.String)]
    public string Color { get; set; }

    [BsonElement("type")]
    [BsonRepresentation(BsonType.String)]
    public string Type { get; set; }

    [BsonElement("_partition")]
    public string Partition { get; set; }
}
public enum Sunlight
{
    Full,
    Partial
}
public enum PlantColor
{
    White,
    Green,
    Yellow,
    Purple
}
public enum PlantType
{
    Perennial,
    Annual
}
```
> Program.cs
```cs
using MongoDB.Driver;
using Console.Entities;

var mongoClient = new MongoClient("mongodb://localhost:27017");
var dbPlantInventory = mongoClient.GetDatabase("inventory");
var plantsCollection = dbPlantInventory.GetCollection<Plant>("plants");

var sweetBasil = new Plant
{
    Name = "Sweet Basil",
    Sunlight = Sunlight.Partial.ToString(),
    Color = PlantColor.Green.ToString(),
    Type = PlantType.Annual.ToString(),
    Partition = "Store 42"
};
var thaiBasil = new Plant
{
    Name = "Thai Basil",
    Sunlight = Sunlight.Partial.ToString(),
    Color = PlantColor.Green.ToString(),
    Type = PlantType.Perennial.ToString(),
    Partition = "Store 42"
};
var helianthus = new Plant
{
    Name = "Helianthus",
    Sunlight = Sunlight.Full.ToString(),
    Color = PlantColor.Yellow.ToString(),
    Type = PlantType.Annual.ToString(),
    Partition = "Store 42"
};
var petunia = new Plant
{
    Name = "Petunia",
    Sunlight = Sunlight.Full.ToString(),
    Color = PlantColor.Purple.ToString(),
    Type = PlantType.Annual.ToString(),
    Partition = "Store 47"
};

var listofPlants = new List<Plant>
{
    sweetBasil,
    thaiBasil,
    helianthus,
    petunia
};
//await plantsCollection.InsertManyAsync(listofPlants);
var results = plantsCollection.Find(x => x.Color == "Green").ToList();

foreach (var result in results)
{
    System.Console.WriteLine(result.Name);

}
```

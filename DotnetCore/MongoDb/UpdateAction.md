### update
- > **$[elem]** use for update all children document in "school" model .(use for children matching the condition)
- > **Users[-1]** user for update only one first of childresn document .(use for filter only unique child)
```cs
 public static UpdateResult Update()
    {
        var user1 = new User { Name = "h23" };
        var user2 = new User { Name = "h2" };
        var school3 = new school
        {
            name = "cho1",
            Users = new List<User> { user1, user2 }
        };
        IMongoCollection<school> _collection = database.GetCollection<school>("test");
        var doctorsFilter = Builders<school>.Filter.ElemMatch(u => u.Users,n=>n.Name=="h23"); 
        var updateNameDefinition = Builders<school>.Update.Set(u => u.Users[-1].Name, "40005");

        // update the document
        var updateNameResult = _collection.UpdateOne(doctorsFilter,updateNameDefinition);
        return updateNameResult;
    }
    //////////////////////////////////Array
public static string UpdateArray()
    {
        IMongoCollection<school> _collection = database.GetCollection<school>("test");
        var update = Builders<school>.Update
    .Set("Users.$[elem].Name", "5678");

        var updateResult = _collection.UpdateOne(
            Builders<school>.Filter.Eq(u=>u.Id, new ObjectId("63c7aa88722fd53c7cb58c76")), update,
            new UpdateOptions()
            {
                ArrayFilters = new List<ArrayFilterDefinition<User>>()
                {
            new BsonDocument("elem.Name",
            new BsonDocument("$eq", "45"))
                }
            });
        return "done";
    }
    
    /////////////////////////////////////////Model
    public class User
{
    public string Name { get; set; }
}
public class school
{
    public ObjectId Id { get; set; }
    public string name { get; set; }
    public List<User> Users { get; set; }
}
```

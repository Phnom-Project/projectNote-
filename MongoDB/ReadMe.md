#### Mongodb (cloud service)
- permission
    - readWrite-built-in role : can drop collection, should use custom-role (Collection Action) with read-built-in role (Database Action and Role) in custom-role.
- createSearchIndex
    - add readWrite-builtIn-role in custom-roles, it have all most permission
#### Backup & Restore
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

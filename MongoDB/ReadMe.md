### 2. Mongodb (cloud service)
- permission
    - **readWrite-built-in role** : can drop collection, should use custom-role (Collection Action) with **read-built-in role** (Database Action and Role) in custom-role.
```ps1
# Collection Action
# > Query and Write Actions
find@database
insert@database
remove@database
update@database
bypassDocumentValidation@database
# > DB Management Actions
createCollection@database
createIndex@database

# Built-in Role 
read@thelube # Atlas Search required
```
- createSearchIndex (if need access from api-server)
    - add readWrite-builtIn-role in custom-roles, it have all most permission
### 1. Backup & Restore
```ps1
# To avoid be visible to system status programs such as `ps` that may be invoked by other users, Enter password manually
# Backup
../mongodump --uri="mongodb+srv://<Username>@mongodb.net/<DatabaseName>" --out="mongo/"
>> Enter password:

# Restore
../mongorestore --uri="mongodb+srv://<Username>@mongodb.net/<DatabaseName>" "mongo/<DatabaseName>/"
>> Enter password:
```
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

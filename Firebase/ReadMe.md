#### Preview `(public => publish/wwwroot)`
```shell
firebase init 
firebase emulators:start (optional)
firebase hosting:channel:deploy CHANNEL_ID
```
#### Deploy
```shell
firebase deploy
```
#### For specific another site subdomain
```
npm install -g firebase-tools
firebase login
firebase init
```
> add more to firebase.json
```json
{
  "hosting": {
    "site": "webassemblytesthome",
    "public": "publish/wwwrooot",
  }
}
```
> and 
```shell
firebase deploy --only hosting:webassemblytesthome

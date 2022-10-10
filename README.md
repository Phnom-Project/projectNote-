# projectNote-
```diff
+ Green
- Red
! Orange
@@ Pink @@
# Gray
```
- `$` = sign of customize name of user 
### Clear cache(blazor pwa)
> service-worker.published.js
```js
const CACHE_VERSION = 1.0;
//add code below for new version
const CACHE_VERSION = 1.1;
```
### Load file locally
> locally
- file:///D:/Download/
> server
- https://github.com/
### Hot Reload (blazor)
> launchSetting.json
```json
"hotReloadProfile": "blazorwasm"
```
>cmd `dont forget save all ctl+shift+s`
```
dotnet watch run
```
http://localhost:5000
### gradle (android studio)
>window
```shell
./gradlew build
gradlew.bat build
```
### docker
```shell
docker build -t [name] .
```
### GUID
free Online GUID / UUID Generator
https://www.guidgenerator.com/

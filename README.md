# projectNote-
```diff
+ Green
- Red
! Orange
@@ Pink @@
# Gray
```
## List
```
1Clear cache(blazor pwa)
2Load file locally
3Hot Reload (blazor)
4gradle (android studio)
5docker
6GUID
```
- `$` = sign of customize name of user 
### 1Clear cache(blazor pwa)
> service-worker.published.js
```js
const CACHE_VERSION = 1.0;
//add code below for new version
const CACHE_VERSION = 1.1;
```
### 2Load file locally
> locally
- file:///D:/Download/
> server
- https://github.com/
### 3Hot Reload (blazor)
> launchSetting.json
```json
"hotReloadProfile": "blazorwasm"
```
>cmd `dont forget save all ctl+shift+s`
```
dotnet watch run
```
http://localhost:5000
### 4gradle (android studio)
>window
```shell
./gradlew build
gradlew.bat build
```
### 5docker
```shell
docker build -t [name] .
```
### 6GUID
free Online GUID / UUID Generator
https://www.guidgenerator.com/

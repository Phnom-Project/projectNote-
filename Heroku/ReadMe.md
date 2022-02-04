### Initialization
```shell
cd my-project/
git init
heroku git:remote -a pythoneyebird
git add .
git commit -am "make it better"
git push heroku master
```
### Docker
```shell
heroku container:login
heroku create // OR clone existing project first
heroku container:push web   //Build the image and push to Container Registry
heroku container:release web    //Then release the image to your app:
```

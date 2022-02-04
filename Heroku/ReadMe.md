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
heroku container:push --recursive -a pythoneyebird
```

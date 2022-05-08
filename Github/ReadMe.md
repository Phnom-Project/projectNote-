### for existing project
```shell
git init
git add -A //or git add . 
git commit -m 'Added my project'
git remote add origin git@github.com:sammy/my-new-project.git
git push -u -f origin master
```
### auth user for rest github api
```shell
curl -i -u username:$token https://api.github.com/users/octocat
```

###
```shell
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/5W-company/qwe.git
git push -u origin main
```
### for existing project
```shell
git init 
git remote add origin https://github.com/5W-company/1.git
git branch -M main
git pull https://github.com/5W-company/1.git main
git add -A //or git add .
git commit -m 'Added my project'
git push -u origin main
```
> V2
```shell
git remote add origin https://github.com/Phnom-Project/1.git
git branch -M main
git push -u origin main
```
### auth user for rest github api
```shell
curl -i -u username:$token https://api.github.com/users/octocat
```
### Create new Branch
```shell
git checkout -b [name_of_your_new_branch]
```

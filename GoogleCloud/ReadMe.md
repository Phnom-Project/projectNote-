#### gcloud authenticate : *service-account*
```shell
gcloud auth activate-service-account --key-file=hellorungcp.json
gcloud auth print-identity-token
```
### artifact registry
> setup
```
// for us-east1-docker.pkg.dev
gcloud auth configure-docker us-east1-docker.pkg.dev
```
> docker 
> 
```
docker build -t weatherforecastapi-image  -f Dockerfile .
// tag
docker tag weatherforecastapi-image us-east1-docker.pkg.dev/weatherforecastapi-proj/weatherforecastapi-repo/weatherforecastapi-image:v1.0
// push
docker push us-east1-docker.pkg.dev/weatherforecastapi-proj/weatherforecastapi-repo/weatherforecastapi-image:v1.0
```
> note
```
docker push REGION-docker.pkg.dev/PROJECT_ID/REPOSITORY_NAME/TAGGED_IMAGE_NAME
For our purposes these are
- REGION: us-east1
- PROJECT_ID: weatherforecastapi-proj
- Unless they are the same, make sure it's the project_ID and not the project_NAME.
- REPOSITORY_NAME: weatherforecastapi-repo
- TAGGED_IMAGE_NAME: weatherforecastapi-image:v1.0
```
### cloud run

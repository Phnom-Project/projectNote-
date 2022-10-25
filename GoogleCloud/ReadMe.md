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
### cloud run

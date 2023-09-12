# Deploying

To make deployment easy, there are two bash files that are available: `build.sh` and `microk8sbuild.sh`. You can use them with sudo privileges and it will automate building the images and pushing them.

## Building the Docker Image

### If you're using microk8s:
* First, enable the built-in registry: `microk8s enable registry`

* You will need to tag the image in the [correct format](https://microk8s.io/docs/registry-built-in), like this: `sudo docker build -t localhost:32000/pytest:registry .`

* Finally, push the image: `sudo docker push localhost:32000/pytest`
	
### Not microk8s:
* Build the docker image: `sudo docker build -t pytest/app .`.
* Push it to the external Docker Registry of your choice by running `sudo docker push pytest/app`.

## Deploying to Kubernetes

* Once you've got the image ready to go, you can update the configuration in k8s.yml. The most important part is to select which image you're using (localhost for microk8s local registry, non-local otherwise.) By default, it uses a random port in the NodePort range for external use.

* Run `kubectl apply -f k8s.yml` to deploy to your Kubernetes cluster. Note that a ConfigMap is included, which will generate the appropriate database and tables if it's not present.

* Run `kubectl get svc pytest-service` to locate the assigned port. For example, ports 5000:31183/TCP indicates that this can be accessed on port
31183.

The application should now be fully accessible!

## Other Docs

See CICD.md for thoughts on CI/CD.

## Changes and Other Notes:

Flask was updated to version 2.0.3.

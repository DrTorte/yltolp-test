Steps taken:

Python 3.7 (I used 3.7.17)
Update Flask verison to 2.0.3

## Building the Docker Image

### If you're using microk8s:
* First, enable the built-in registry: `microk8s enable registry`

* You will need to tag the image in the [correct format](https://microk8s.io/docs/registry-built-in), like this: `sudo docker build -t localhost:32000/pytest:registry .`

* Finally, push the image: `sudo docker push localhost:32000/pytest`
	
### Not microk8s:
* Build the docker image: `sudo docker build . -n pytest/app`.
* Push it to the external Docker Registry of your choice by running `sudo docker push localhost:32000/pytest`.

**Ensure the correct image is selected in k8s.yml!**

## Deploying to Kubernetes

* Once you've got the image ready to go, you can update any other configuration you wish in k8s.yml. By default, it uses a random port in the NodePort range for external use.

* Run `kubectl apply -f k8s.yml` to deploy to your Kubernetes cluster! Note that a ConfigMap is included, which will generate the appropriate database and tables if it's not present.

* Run `kubectl get svc pytest-service` to locate the assigned port. For example, ports 5000:31183/TCP indicates that this can be accessed on port
31183.

Enjoy!
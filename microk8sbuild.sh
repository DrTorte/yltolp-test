microk8s enable registry
sudo docker build -t localhost:32000/pytest:registry .
sudo docker push localhost:32000/pytest
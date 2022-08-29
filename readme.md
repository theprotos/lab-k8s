# Container Orchestrators

- [Docker Swarm](swarm/readme.md) install and monitoring
- [Helm](helm/readme.md) charts example and repository






Unsorted
```
vagrant plugin list
vagrant plugin install vagrant-vbguest

kubectl cluster-info
kubectl get nodes

kubectl run hello-nginx --image=nginx --port=80
kubectl get pods
kubectl describe pod hello-nginx
kubectl expose deployment hello-nginx --type=NodePort
kubectl get service
kubectl describe service hello-nginx

kubectl logs hello-nginx-5d47cdc4b7-rzrp8 

kubectl scale --replicas=3 deployment/hello-nginx

kubectl delete deployment --all
kubectl delete deployment hello-nginx 

kubectl delete pod hello-nginx-54cdff59b8-2pd9t
kubectl delete pods --all

kubectl config view
```

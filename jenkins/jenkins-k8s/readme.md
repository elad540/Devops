# jenkins k8s
To have local minikube install it using this [guide](https://phoenixnap.com/kb/install-minikube-on-ubuntu)

To apply the files 
```bash
$ kubectl apply -f "file_name"
```
To delete  
```bash
$ kubectl delete -f "file_name"
```
To get pod/service/deployment
```bash
$ kubectl get <resource> --namespace XXX
```
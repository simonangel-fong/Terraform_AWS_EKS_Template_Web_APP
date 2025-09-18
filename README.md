# Terraform_AWS_EKS_FastAPI

```sh
cd infrastructure
terraform plan
terraform apply -auto-approve

aws eks --region ca-central-1 update-kubeconfig --name example

kubectl config current-context

kubectl get nodes

kubectl get nodes -o custom-columns=Name:.metadata.name,nCPU:.status.capacity.cpu,Memory:.status.capacity.memory

# deploy an Nginx instance
kubectl run --port 80 --image nginx nginx
kubectl get pods
kubectl port-forward nginx 3000:80
# http://localhost:3000
```

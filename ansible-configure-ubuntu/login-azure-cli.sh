az login -u asreet-tech@atttrainings.com -p Azure@123456
az account set --subscription 6378784e-0a8a-4197-a15d-afc70adb2952
az aks get-credentials --resource-group rg-aks-0 --name aks-0
sudo snap install kubectl --classic
kubectl get nodes -o wide
kubectl get pods -o wide -A

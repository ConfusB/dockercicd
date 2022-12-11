# Instructions

## Install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

## Start minikube
minikube start
alias kubectl="minikube kubectl --"

## Install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

## Create ghcr pull secret
kubectl create secret docker-registry ghcr-login-secret --docker-server=https://ghcr.io --docker-username=$YOUR_GITHUB_USERNAME --docker-password=$YOUR_GITHUB_TOKEN --docker-email=$YOUR_EMAIL

## install helm chart
helm install happy-panda bitnami/wordpress
helm upgrade -i hello-python ./helm/hello-python --values ./helm/hello-python/values.yaml

## Check if running
kubectl  get po -n=default
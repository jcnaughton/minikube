#!/bin/sh


##############################
# Check virtualization
# egrep --color 'vmx|svm' /proc/cpuinfo
##############################


curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64   && chmod +x minikube
sudo install minikube /usr/local/bin
wget https://download.virtualbox.org/virtualbox/6.0.8/virtualbox-6.0_6.0.8-130520~Ubuntu~bionic_amd64.deb
apt-get install gcc g++ make ureadahead systemd mime-support shared-mime-info -y
apt --fix-broken install
sudo dpkg -i virtualbox-6.0_6.0.8-130520~Ubuntu~bionic_amd64.deb

minikube start
df -H
kubectl run hello-minikube --image=k8s.gcr.io/echoserver:1.10 --port=8080
kubectl expose deployment hello-minikube --type=NodePort
kubectl get pod
minikube service hello-minikube --url

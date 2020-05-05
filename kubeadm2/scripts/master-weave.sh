#!/bin/bash

echo '========== Init cluster'
sudo kubeadm init --apiserver-advertise-address=192.168.200.100 | grep -- "-token-\|--token" > /vagrant/join_token.txt

echo '========== Init weave network'
sudo kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

echo '========== Create kube profile for user'
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get pods --all-namespaces
#kubectl get pod -n kube-system -w
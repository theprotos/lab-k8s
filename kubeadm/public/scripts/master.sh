#!/bin/bash

echo '========== Starting kubectl'
sudo kubeadm init --apiserver-advertise-address=192.168.100.20 | grep 'kubeadm join --token' > /vagrant/public/join_token.txt

HOME1="/home/ubuntu"
mkdir -p $HOME1/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME1/.kube/config
sudo chown $(id -u):$(id -g) $HOME1/.kube/config

sudo kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
sudo kubectl proxy --port=8080
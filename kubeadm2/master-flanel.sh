#!/bin/bash

echo '========== Init cluster'
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.200.100 | grep -- "-token-\|--token" > /vagrant/join_token.txt
echo '========== Init flannel network'
#sudo kubectl apply -f /vagrant/flannel-vagrant.yml
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
#sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml

echo '========== Create kube profile for user'
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sudo kubectl get pods --all-namespaces
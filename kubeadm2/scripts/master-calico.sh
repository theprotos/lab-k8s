#!/bin/bash

echo '========== Init cluster'
sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address=192.168.200.100 | grep -- "-token-\|--token" > /vagrant/join_token.txt

echo '========== Create kube profile for user'
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo '========== Init calico network'
kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml

kubectl get pods --all-namespaces

curl -sL https://github.com/containernetworking/plugins/releases/download/v0.8.5/cni-plugins-linux-amd64-v0.8.5.tgz > cni.tgz

curl -s https://api.github.com/repos/containernetworking/plugins/releases/latest | grep tag_name | cut -d '"' -f 4



sudo mkdir -p /opt/cni/bin
sudo tar -C /opt/cni/bin -xzf cni.tgz
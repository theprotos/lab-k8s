#!/bin/bash

#echo '========== Init cluster flannel network - does not work for vagrant'
#sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.200.100 | grep -- "-token-\|--token" > /vagrant/join_token.txt
#sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

echo '========== Init cluster with flannel network'
#export FLANNEL_OPTIONS=--iface=eth1
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.200.100 | grep -- "-token-\|--token" > /vagrant/join_token.txt
sudo kubectl apply -f /vagrant/flannel-vagrant.yml


echo '========== Create kube profile for user'
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


#export KUBECONFIG=/etc/kubernetes/admin.conf
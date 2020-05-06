#!/bin/bash

printf "\n$(date +%T) ==========[ Init cluster ]==========\n"
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.200.100 | grep -- "-token-\|--token" > /vagrant/join_token.txt

export KUBECONFIG=/etc/kubernetes/admin.conf

printf "\n$(date +%T) ==========[ Deploy flannel network ]==========\n"
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

#!/bin/bash

printf "\n$(date +%T) ==========[ Init cluster ]==========\n"
sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address=192.168.200.100 | grep -- "-token-\|--token" > /vagrant/join_token.txt

export KUBECONFIG=/etc/kubernetes/admin.conf

printf "\n$(date +%T) ==========[ Deploy calico network ]==========\n"
kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml

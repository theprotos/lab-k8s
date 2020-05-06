#!/bin/bash

printf "\n$(date +%T) ==========[ Init cluster ]==========\n"
sudo kubeadm init --apiserver-advertise-address=192.168.200.100 | grep -- "-token-\|--token" > /vagrant/join_token.txt

export KUBECONFIG=/etc/kubernetes/admin.conf

printf "\n$(date +%T) ==========[ Deploy weave network ]==========\n"
sudo kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

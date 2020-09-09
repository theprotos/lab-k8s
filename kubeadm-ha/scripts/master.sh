#!/bin/bash

printf "\n$(date +%T) ==========[ Create kube profile for user ]==========\n"
HOME1="/home/vagrant"
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

printf "\n$(date +%T) ==========[ Deploy metrics server ]==========\n"
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml

printf "\n$(date +%T) ==========[ Deploy dashboard ]==========\n"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
kubectl proxy --port=8080 --address='192.168.200.100' --accept-hosts='.*' &

sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.200.100
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml

https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm/



kubectl get pods -n kube-system -o wide
kubectl get pods --all-namespaces

systemctl daemon-reload
sudo systemctl restart kubelet
sudo systemctl status kubelet -l

kubectl describe pod coredns-66bff467f8-tnqtk -n kube-system

kubectl taint nodes --all node-role.kubernetes.io/master-



sudo kubelet

ps -ef | grep kubelet



See Config files:  
/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf

See logs
sudo journalctl -fu kubelet
sudo journalctl -xe

## Vagrant troubleshooting

vagrant global-status --prune

vagrant plugin repair
vagrant plugin update
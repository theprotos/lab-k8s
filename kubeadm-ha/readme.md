https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm/



kubectl get pods --all-namespaces -o wide

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
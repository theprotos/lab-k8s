# Docker Swarm

Starts master+2nodes Swarm cluster via vagrant
```
vagrant up
#or reload config after changes
vagrant reload --provision
```

Cluster Bootstrap [vagrant-scripts](scripts) does below: 
- bootstrap master
- bootstrap nodes
- create swarm master, token in join_token.txt
- join nodes to the master

Deploy [script](scripts/deploy.sh) does deploy:
- [ip tracker](https://hub.docker.com/r/yeasy/simple-web/) on http://192.168.200.200:8080
- [portainer](https://github.com/portainer/portainer) on http://192.168.200.200:9000
- [swarmprom](https://github.com/stefanprodan/swarmprom)
  - prometheus (metrics database) http://192.168.200.200:9090
  - grafana (visualize metrics) http://192.168.200.200:3000
  - node-exporter (host metrics collector)
  - cadvisor (containers metrics collector)
  - dockerd-exporter (Docker daemon metrics collector, requires Docker experimental metrics-addr to be enabled)
  - alertmanager (alerts dispatcher) http://192.168.200.200:9093
  - unsee (alert manager dashboard) http://192.168.200.200:9094
  - caddy (reverse proxy and basic auth provider for prometheus, alertmanager and unsee) 





https://github.com/docker/awesome-compose
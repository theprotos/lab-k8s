#!/usr/bin/bash

printf "\n$(date +%T) ==========[ Init cluster ]==========\n"
rm -rf /vagrant/join_token.txt
sudo docker swarm init --advertise-addr 192.168.200.200 | grep -- "-token-\|--token" > /vagrant/join_token.txt || :
printf "\n$(date +%T) cat token: $(cat /vagrant/join_token.txt)"

printf "\n$(date +%T) ==========[ Set labels ]==========\n"
export USE_HOSTNAME=master.localhost
echo $USE_HOSTNAME > /etc/hostname
hostname -F /etc/hostname
export DOMAIN=swarmpit.sys.example.com
export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')
docker node update --label-add swarmpit.db-data=true $NODE_ID
docker node update --label-add swarmpit.influx-data=true $NODE_ID
docker node update --label-add portainer.portainer-data=true $NODE_ID
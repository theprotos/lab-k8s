cd ../repo-apps
pwd
docker node ls
docker stack deploy -c getip.yaml getip

git clone --depth 1 -b master https://github.com/stefanprodan/swarmprom.git /tmp/swarmprom
cd /tmp/swarmprom
ADMIN_USER=admin \
ADMIN_PASSWORD=admin \
SLACK_URL=https://hooks.slack.com/services/TOKEN \
SLACK_CHANNEL=devops-alerts \
SLACK_USER=alertmanager \
docker stack deploy -c docker-compose.yml mon

docker network create -d overlay traefik-public
#docker stack deploy -c swarmpit.yaml swarmpit
docker stack deploy -c portainer.yaml portainer
docker service ls
#docker stack ps swarmpit
#docker network ls

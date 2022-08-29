#!/usr/bin/bash

printf "\n  [$(date +'%Y-%m-%dT%H:%M:%S%z')]: ========== BOOTSTRAP STARTED ============"

#echo "nameserver 8.8.8.8" > /etc/resolv.conf
#/etc/init.d/networking restart

echo -e "\n  [$(date +'%Y-%m-%dT%H:%M:%S%z')]: SSH enable password login"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && echo -e "\tSSH [ OK ]"
service sshd restart

echo -e "\n  [$(date +'%Y-%m-%dT%H:%M:%S%z')]: Install docker"
apk add -q --update docker docker-compose git

addgroup vagrant docker
rc-update add docker boot
service docker start
sleep 4s
printf "\n  [$(date +'%Y-%m-%dT%H:%M:%S%z')]: ========== BOOTSTRAP COMPLETED ============"

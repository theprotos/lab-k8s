#!/bin/bash

printf "\n$(date +%T) ==========[ Install haproxy ]==========\n"
apk -q add haproxy

printf "\n$(date +%T) ==========[ Copy haproxy config ]==========\n"
/bin/cp -rf /vagrant/conf/haproxy.cfg /etc/haproxy/haproxy.cfg
printf "\n$(date +%T) ==========[ Enable and start haproxy ]==========\n"
rc-update add haproxy default
service haproxy start

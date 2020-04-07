#!/bin/bash

echo "========== RUNNING TUNING"
sudo sysctl -w fs.inotify.max_user_instances=1048576
sudo sysctl -w fs.inotify.max_queued_events=1048576
sudo sysctl -w fs.inotify.max_user_watches=1048576
sudo sysctl -w vm.max_map_count=262144
sudo sysctl -p
sudo sysctl --system

sudo apt-get update -q -y
sudo apt-get install -qy docker.io

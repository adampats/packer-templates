#!/bin/bash

export COMPOSE_RELEASE='1.5.1'
export USER='ec2-user'

sudo yum update -y
sudo yum install -y curl wget git nmap dstat sl docker

sudo service docker start
sudo usermod -a -G docker "$USER"

sudo sh -c "curl -L https://github.com/docker/compose/releases/download/$COMPOSE_RELEASE/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose

echo "Done."

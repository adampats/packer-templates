#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export COMPOSE_RELEASE='1.5.1'

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl wget git nmap dstat sl build-essential

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list'
sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/docker.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"
sudo apt-get install -y docker-engine

sudo sh -c "curl -L https://github.com/docker/compose/releases/download/$COMPOSE_RELEASE/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose

echo "Done."

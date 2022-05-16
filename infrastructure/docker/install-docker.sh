#!/bin/bash

# upgrade host
sudo dnf upgrade -y

# install yum-utils
sudo dnf install -y yum-utils

# add docker repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# remove conflicting packages
sudo dnf remove -y buildah podman

# install docker packages
sudo dnf install -y docker-ce docker-ce-cli containerd.io

# enable services in systemd
sudo systemctl start docker && sudo systemctl enable docker
sudo systemctl enable containerd

# post docker install steps
# manage docker as non-root user
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

## fix this
# install docker-compose
#mkdir -p ~/.docker/cli-plugins/
#curl -sSL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
#chmod +x ~/.docker/cli-plugins/docker-compose
#docker compose version

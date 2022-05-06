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
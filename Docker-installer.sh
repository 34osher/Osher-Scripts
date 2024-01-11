# Auto Installation of docker on linux.
# Ubuntu based.
#
# Made by Eliran Ben Maor.

#!/bin/bash
# set -x 
# set -e
echo "Code written by : Eliran Ben Maor"
echo "Last update: 26/11/2023"
echo "Last time checked: 26/11/2023 by: Eliran"

# Uninstall all conflicting packages:
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install the latest version
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Post install - Create 'docker' group
sudo groupadd docker 2>/dev/null

# Add your user to the docker group
sudo usermod -aG docker $USER

# Activate the changes to group docker
newgrp docker

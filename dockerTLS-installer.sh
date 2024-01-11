#!/bin/bash
echo "Code written by : Eliran Ben Maor"
ehco "Last update: 04/09/2023"
echo "Last time checked: 04/09/2023 by: Eliran"
# Install Docker on Linux Ubuntu with TLS

# Remove any existing Docker installations
sudo apt-get remove docker docker-engine docker.io containerd runc 2>/dev/null

# Update and install prerequisites
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg lsb-release openssl -y

# Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Post-install steps
# Create Docker group
sudo groupadd docker  2>/dev/null

# Add current user to Docker group
sudo usermod -aG docker $USER

# Activate the changes to group
newgrp docker 

# Generate TLS certificates
mkdir -p ~/.docker/tls
openssl genpkey -algorithm RSA -out ~/.docker/tls/ca-key.pem
openssl req -new -key ~/.docker/tls/ca-key.pem -x509 -days 365 -out ~/.docker/tls/ca.pem
openssl genpkey -algorithm RSA -out ~/.docker/tls/server-key.pem
openssl req -new -key ~/.docker/tls/server-key.pem -out ~/.docker/tls/server.csr
openssl x509 -req -days 365 -in ~/.docker/tls/server.csr -CA ~/.docker/tls/ca.pem -CAkey ~/.docker/tls/ca-key.pem -CAcreateserial -out ~/.docker/tls/server-cert.pem

# Configure Docker daemon to use TLS
echo '{
  "tlsverify": true,
  "tlscacert": "/home/$USER/.docker/tls/ca.pem",
  "tlscert": "/home/$USER/.docker/tls/server-cert.pem",
  "tlskey": "/home/$USER/.docker/tls/server-key.pem"
}' | sudo tee /etc/docker/daemon.json > /dev/null

# Restart Docker to apply changes
sudo systemctl restart docker

# Test Docker version
docker -v


#!/bin/bash
echo "Code written by : Eliran Ben Maor"
ehco "Last update: 04/09/2023"
echo "Last time checked: 04/09/2023 by: Eliran"

sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce docker-compose-plugin
sudo rm -rf /var/lib/docker /etc/docker
sudo rm /etc/apparmor.d/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
sudo snap remove docker
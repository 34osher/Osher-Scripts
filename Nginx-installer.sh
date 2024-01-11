#!/bin/bash
echo "Code written by : Eliran Ben Maor"
ehco "Last update: 04/09/2023"
echo "Last time checked: 04/09/2023 by: Eliran"

echo "Getting updates"
sudo apt-get update -y
echo "Installing nginx"
sudo apt-get install nginx
#Check if nginx installed 
if [ `nginx -v` ]
then 
	echo "Somthing went wrong please try again"
else
	echo "Done! you can use nginx now"
fi

sudo apt install curl gnupg2 ca-certificates lsb-release ubuntu-keyring

curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
| sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null

gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg

sudo ufw allow 'Nginx HTTP'
sudo ufw status

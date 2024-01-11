#!/bin/bash
echo "Code written by : Eliran Ben Maor"
ehco "Last update: 04/09/2023"
echo "Last time checked: 04/09/2023 by: Eliran"

sudo apt-get install openssh-server
echo "Enable and start the ssh service immediately"
sudo systemctl enable ssh --now

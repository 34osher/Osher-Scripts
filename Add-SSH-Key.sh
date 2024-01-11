#!/bin/bash
echo "Code written by : Eliran Ben Maor"
ehco "Last update: 04/09/2023"
echo "Last time checked: 04/09/2023 by: Eliran"
#To able to use it for everywhere just
#sudo cp Add-SSH-Key.sh /usr/local/bin/awskey
#sudo chmod +x /usr/local/bin/awskey


# Directory containing the SSH keys
ssh_key_dir="/home/eliranbm/.ssh"

# Loop over each file in the directory
for key in "$ssh_key_dir"/*; do
  # Check if the file is a regular file (and not a directory, etc.)
  if [ -f "$key" ]; then
    # Add the key to ssh-agent
    ssh-add "$key"
  fi
done

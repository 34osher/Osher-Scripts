#!bin/bash
echo "Code written by : Eliran Ben Maor"
ehco "Last update: 04/09/2023"
echo "Last time checked: 04/09/2023 by: Eliran"

if [ `unzip` ]; then
    echo zip is installed
else
    echo Installing unzip
    sudo apt install unzip
fi

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo rm -rf awscliv2.zip
sudo rm -rf ./aws
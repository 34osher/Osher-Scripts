#!/bin/bash

# Prompt for ESXi host details
read -p "Enter ESXi host name: " host_name
read -p "Enter ESXi host IP: " host_ip
read -s -p "Enter password for $host_name: " host_password
echo

# Using SSH to connect to ESXi host
sshpass -p "$host_password" ssh -o StrictHostKeyChecking=no "$host_name"@"$host_ip"

# The 'sshpass' command is used to pass the password to ssh
# The '-o StrictHostKeyChecking=no' option is used to automatically accept new host keys. 
# Caution: This is not recommended for production environments as it may pose a security risk.

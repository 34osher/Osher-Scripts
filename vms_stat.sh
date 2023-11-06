#!/bin/bash

# Prompt for ESXi host details
read -p "Enter ESXi host name: " host_name
read -p "Enter ESXi host IP: " host_ip
read -s -p "Enter password for $host_name: " host_password
echo

# Using SSH to connect to ESXi host and list VMs
IFS=$'\n'       # Change the Internal Field Separator to newline, so we only split lines on newlines
set -o pipefail # Make the pipe fail if any command in the pipeline fails

# Get the list of all VMs
vms_list=$(sshpass -p "$host_password" ssh -o StrictHostKeyChecking=no "$host_name"@"$host_ip" "vim-cmd vmsvc/getallvms")

# Check if we got the list correctly
if [ $? -ne 0 ]; then
  echo "Failed to get the list of VMs"
  exit 1
fi

# Read through the list of VMs
for line in $vms_list; do
  # Attempt to extract the VMID and VM name from the line
  vmid=$(echo $line | awk '{print $1}')
  
  # Check if VMID is a number to filter out the header and any other non-VM lines
  if [[ $vmid =~ ^[0-9]+$ ]]; then
    vmname=$(echo $line | awk '{print $2}')

    # Get the power state of the VM
    vm_state=$(sshpass -p "$host_password" ssh -o StrictHostKeyChecking=no "$host_name"@"$host_ip" "vim-cmd vmsvc/power.getstate $vmid" | grep 'Powered' | awk '{ print $2 }')

    # Print VM ID, name, and state
    echo "VM ID: $vmid, VM Name: $vmname, State: $vm_state"
  fi
done

unset IFS # Reset the Internal Field Separator back to default


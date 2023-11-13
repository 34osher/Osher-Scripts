#!/bin/bash

# Check server uptime
echo "Checking server uptime..."
uptime

# Check disk usage and alert if it exceeds 80%
echo "Checking disk usage..."
disk_usage=$(df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }')
while read -r usage filesystem; do
  percent=$(echo $usage | sed 's/%//g')
  if [ $percent -ge 80 ]; then
    echo "Disk usage alert: $filesystem is ${usage} full."
  else
    echo "Disk usage check passed for $filesystem."
  fi
done <<< "$disk_usage"

# Check memory usage and alert if it exceeds 80%
echo "Checking memory usage..."
memory_usage=$(free -m | awk 'NR==2{printf "%.2f%%\n", $3*100/$2 }')
used_memory=$(echo $memory_usage | sed 's/%//g')
if [ $(echo "$used_memory >= 80" | bc) -ne 0 ]; then
  echo "Memory usage alert: Memory usage is at $memory_usage."
else
  echo "Memory usage check passed."
fi

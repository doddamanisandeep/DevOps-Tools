#!/bin/bash

# Get disk usage percentage
usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check condition
if (( usage > 80 )); then
    echo "ALERT: Disk space usage is above 80%! Current usage: $usage%"
else
    echo "Disk space is under control. Current usage: $usage%"
fi

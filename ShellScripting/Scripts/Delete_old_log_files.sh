#!/bin/bash

# Log directory
log_dir="/var/log"

# Find and delete old logs
find "$log_dir" -name "*.log" -type f -mtime +7 -exec rm -f {} \;

echo "Old log files deleted successfully!"

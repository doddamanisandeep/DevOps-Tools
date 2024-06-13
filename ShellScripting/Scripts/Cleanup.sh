#!/bin/bash

# Define the directory containing backup files
backup_dir="/path/to/backup/destination"

# Define the maximum age of backup files to keep (in days)
max_age=7

# Define the directory containing temporary files
temp_dir="/path/to/temporary/files"

# Define the maximum age of temporary files to keep (in hours)
temp_max_age=24

# Remove old backup files
find "$backup_dir" -name "backup_*.tar.gz" -type f -mtime +$max_age -exec rm {} \;
echo "Old backup files removed."

# Remove temporary files
find "$temp_dir" -type f -mmin +$((temp_max_age * 60)) -exec rm {} \;
echo "Old temporary files removed."










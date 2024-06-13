#!/bin/bash

# Define directories to backup
backup_dirs="/path/to/backup/dir1 /path/to/backup/dir2"

# Backup destination directory
backup_dest="/path/to/backup/destination"

# Create a timestamp for the backup file
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Create backup filename with timestamp
backup_file="backup_$timestamp.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$backup_dest"

# Create tar archive of backup directories
tar -czf "$backup_dest/$backup_file" $backup_dirs

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $backup_file created in $backup_dest"
else
    echo "Backup failed"
fi

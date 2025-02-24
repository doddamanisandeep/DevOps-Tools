import shutil
import os

# Define source and backup directories
source_dir = "/home/user/Documents"
backup_dir = "/home/user/Backup"

# Ensure backup directory exists
os.makedirs(backup_dir, exist_ok=True)

# Loop through files and copy them
for file_name in os.listdir(source_dir):
    full_path = os.path.join(source_dir, file_name)
    if os.path.isfile(full_path):
        shutil.copy(full_path, backup_dir)

print("Backup completed successfully!")

#!/bin/bash

# Define the backup directory and filename
backup_dir="/db_backup"
backup_filename="weatherapp_backup_$(date +'%Y%m%d%H%M%S').sql"

# MySQL container name
mysql_container="alpha-db"

# MySQL root password
mysql_root_password="BoQU2SSK*PJqYYS8L*w8rDn"

# Create the backup
docker exec -i alpha-db mysqldump -uroot -p"$mysql_root_password" auth > "$backup_dir/$backup_filename"

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup successful. Backup saved to $backup_dir/$backup_filename"
else
  echo "Backup failed."
fi

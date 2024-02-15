#!/bin/bash

# Define the directory containing backup files
backup_dir="/db_backup"

# MySQL container name
mysql_container="alpha-db"

# MySQL root password
mysql_root_password="BoQU2SSK*PJqYYS8L*w8rDn"

# List of database backups to restore (replace these with your backup filenames)
backup_files=("weatherapp_backup_20231104102159.sql" "mysql_backup_20231104102159.sql" "auth_backup_20231104102159.sql")

# Loop through each backup file and restore the database
for backup_file in "${backup_files[@]}"; do
  # Extract the database name from the backup filename
  db_name="${backup_file%%_backup_*}"
  
  # Check if the backup file exists
  if [ -f "$backup_dir/$backup_file" ]; then
    docker exec -i "$mysql_container" mysql -uroot -p"$mysql_root_password" "$db_name" < "$backup_dir/$backup_file"
    
    # Check if the restore was successful
    if [ $? -eq 0 ]; then
      echo "Restore of $db_name from $backup_file successful."
    else
      echo "Restore of $db_name from $backup_file failed."
    fi
  else
    echo "Backup file $backup_file not found in $backup_dir. Skipping restore."
  fi
done

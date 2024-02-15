#!/bin/bash

# Define the path to the backup file
backup_file="/db_backup/weatherapp_backup_20231104100836.sql"

# MySQL container name
mysql_container="alpha-db"

# MySQL root password
mysql_root_password="BoQU2SSK*PJqYYS8L*w8rDn"

# Restore the database
docker exec -i alpha-db mysql -uroot -p"$mysql_root_password" auth < "$backup_file"

# Check if the restore was successful
if [ $? -eq 0 ]; then
  echo "Database restore successful."
else
  echo "Database restore failed."
fi

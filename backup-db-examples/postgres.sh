#!/bin/bash

# Define the backup directory
backup_dir="/db_backup"

# PostgreSQL container name
postgres_container="postgres-db"

# PostgreSQL superuser username
postgres_user="postgres"

# List of databases to back up (replace these with your database names)
databases=("weatherapp" "auth")

# Loop through each database and create a backup
for db_name in "${databases[@]}"; do
  backup_filename="${db_name}_backup_$(date +'%Y%m%d%H%M%S').sql"
  docker exec -i "$postgres_container" pg_dump -U "$postgres_user" -d "$db_name" > "$backup_dir/$backup_filename"

  # Check if the backup was successful
  if [ $? -eq 0 ]; then
    echo "Backup of $db_name successful. Backup saved to $backup_dir/$backup_filename"
  else
    echo "Backup of $db_name failed."
  fi
done





#!/bin/bash

# Define the backup directory
backup_dir="/db_backup"

# PostgreSQL container name
postgres_container="alpha-db"

# PostgreSQL superuser username
postgres_user="postgres"

# List of databases to restore (replace these with your database names)
databases=("weatherapp" "auth")

# Loop through each database and restore from backup
for db_name in "${databases[@]}"; do
  backup_filename="${db_name}_backup.sql"
  docker exec -i "$postgres_container" psql -U "$postgres_user" -d "$db_name" < "$backup_dir/$backup_filename"

  # Check if the restore was successful
  if [ $? -eq 0 ]; then
    echo "Restore of $db_name successful from $backup_filename"
  else
    echo "Restore of $db_name from $backup_filename failed."
  fi
done

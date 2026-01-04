#!/bin/bash

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")
BACKUP_DIR="/var/backups/skole"
SOURCE="/skole-data"

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/backup-$TIMESTAMP.tar.gz" "$SOURCE"
find "$BACKUP_DIR" -type f -mtime +7 -delete
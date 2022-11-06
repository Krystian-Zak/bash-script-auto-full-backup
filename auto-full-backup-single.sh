#!/bin/bash

# What to backup
BACKUP_FILES="<PATH>"
# Where to backup to
BACKUP_DESTINATION="<PATH>"

# Create archive filename
FILE=backup-$(date +'%Y-%m-%d-%H-%M').7z

MAX_BACKUP_FILES_AMOUNT=<AMOUNT>

# Making archive
7za a -t7z -m0=lzma2 -mx=9 -mfb=64  -md=32m -ms=on -mhe=on  $BACKUP_DESTINATION/$FILE $BACKUP_FILES

# Counting backup files in backup folder
BACKUP_FILES_AMOUNT=$(ls $BACKUP_DESTINATION/backup-* | wc -l)

if [ "$BACKUP_FILES_AMOUNT" -gt "$MAX_BACKUP_FILES_AMOUNT" ] ; then
    OLDEST_FILE=$(ls $BACKUP_DESTINATION/backup-* -l | head -1 | awk '{print $9}')
    # Deleting the oldest file with backup
    rm -f $OLDEST_FILE
fi
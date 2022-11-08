#!/bin/bash

# What to backup
BACKUP_FILES=("<PATH1>"
              "<PATH2>"
              "<PATH3>"
              "<PATH4>")

# Where to backup to
BACKUP_DESTINATION="<PATH>"

MAX_BACKUP_FILES_AMOUNT=<AMOUNT>

backup () {
    # Create archive filename
    FILE=backup-$2-$(date +'%Y-%m-%d-%H-%M').7z
    # Making archive
    7za a  -t7z -m0=lzma2 -mx=9 -mfb=64  -md=32m -ms=on -mhe=on  $BACKUP_DESTINATION/$2/$FILE $1
}

backup_clean () {
    # Counting backup files in backup folder
    BACKUP_FILES_AMOUNT=$(ls $BACKUP_DESTINATION/$1/backup-$1-* | wc -l)
    if [ "$BACKUP_FILES_AMOUNT" -gt "$MAX_BACKUP_FILES_AMOUNT" ] ; then
        OLDEST_FILE=$(ls $BACKUP_DESTINATION/$1/backup-$1-* -l | head -1 | awk '{print $9}')
        # Deleting the oldest file with backup
        rm -f $OLDEST_FILE
    fi
}

for str in ${BACKUP_FILES[@]}; do
    FILENAME=$(echo "$str" | sed 's/\///' | sed 's/\//-/g')
    backup $str $FILENAME
    backup_clean $FILENAME
done
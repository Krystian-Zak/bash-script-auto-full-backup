## General info
This is a [simple bash script](auto-full-backup-single.sh) that backs up the files and zip them into a 7z archive, then counts the number of backup files in the specified folder when the amount is greater than the specified amount, then the script deletes the oldest backup file.

## Requirements
* 7z (you can use another archiver)
* task scheduler - e.g. cron (optionally)

## Configuration
To run this script, you need to:

1. Specify the files you want to backup, for example:
```
    BACKUP_FILES="/home/user"
```
2. Specify where to save the backup file, for example:
```
    BACKUP_DESTINATION="/media/data/backup/myuser"
```
3. Specify the amount of backup files to keep:
```
    MAX_BACKUP_FILES_AMOUNT=<AMOUNT>
```
4. (Optionally) Add automatic script execution to the schedule of tasks at a specified time, for example crontab:
```
* *  * * 1   <user>      /<path-to-scripts>/auto-full-backup-single.sh
```

#!/bin/bash

cd $RESTIC_PATH

echo Backup files
bash ./backup-files.sh

#echo Backup Postgres
#bash ./backup-postgres.sh

#echo Backup MySQL
#bash ./backup-mariadb.sh


cd $RESTIC_PATH

#echo Cleanup
#restic forget --keep-daily 7 --keep-weekly 4 --keep-monthly 12

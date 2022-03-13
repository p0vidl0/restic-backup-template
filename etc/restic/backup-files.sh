#!/bin/bash

RESTIC_PATH=/etc/restic

cd $RESTIC_PATH

DIRS=($(find . -name "backup-*" -maxdepth 1 -type d))

for DIR in "${DIRS[@]}"; do
  CLEAN_DIR=${DIR##*/}
  TAG=${DIR##*/backup-}
  FULL_DIR="$RESTIC_PATH/$CLEAN_DIR"
  cd $FULL_DIR
  restic backup --files-from files.list --exclude-file exclude.list --tag $TAG
done
#!/bin/bash

# Script name: wikibackup.sh
# Author: Antonio Perretta
# Created on: 05/11/15
# Description: A short script to backup my wiki


# setting variables

wkdir=/cygdrive/e/
bkdir=/cygdrive/d/backups/wiki/
bk1="$bkdir"/"$( date '+%m.%d.%y' )"

# test if the file is allready there. update with differences if it's there or create & rsync if not

if [[ -d "$bkdir""$( date '+%m.%d.%y' )" ]]; then
    rsync --update -ra "$wkdir" "$bk1"
else
     mkdir "$bkdir""$( date '+%m.%d.%y' )"
    rsync -ar "$wkdir" "$bk1"
fi

# test that they copied correctly and give prompt

if [[ $(diff -qr $wkdir $bk1) = "$test" ]]; then
    echo "Files successfully backed up"
else
    echo "File did not successfully back up"
    exit 1
fi

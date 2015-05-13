#!/bin/bash

# Script name: wikibackup.sh
# Author: Antonio Perretta
# Created on: 05/11/15
# Description: A short script to backup my wiki


# setting variables

wkdir=/cygdrive/e/
bkdir=/cygdrive/d/backups/wiki/
bk1="$bkdir"/"$( date '+%m.%d.%y' )"
empty=


# test if the file is allready there. update with differences if it's there or create & rsync if not

if [[ -d "$bkdir""$( date '+%m.%d.%y' )" ]]; then
    if [[ $(diff -qr $wkdir $bk1) = "$empty" ]]; then
        echo "Backup is allready up to date"
        exit 0
    else
        rsync --update -ra "$wkdir" "$bk1"
    fi
else
    mkdir "$bkdir""$( date '+%m.%d.%y' )"
    rsync -ar "$wkdir" "$bk1"
fi

# test that they copied correctly and give prompt

if [[ $(diff -qr $wkdir $bk1) = "$test" ]]; then
    echo "Files successfully backed up"
else
    echo "File did not successfully back up"
    exit 0
fi

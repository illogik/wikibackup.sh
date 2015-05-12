#!/bin/bash

# Script name: wikibackup.sh
# Author: Antonio Perretta
# Created on: 05/11/15
# Description: A short script to backup my wiki


# setting variables

wkdir=/cygdrive/e/
bkdir=/cygdrive/d/backups/wiki/
bk1="$bkdir"/"$( date '+%m.%d.%y' )"
test=

# test to see if there is a backup file for today and create if there isnt

if [[ -d "$bkdir""$( date '+%m.%d.%y' )" ]]; then
    read -p "A backup for today allready exists. Would you like to overwrite? (y/n) > " response1
        if [[ "$response1" != "y" ]]; then
            echo "Exiting"
            exit 1
        fi
    else mkdir "$bkdir""$( date '+%m.%d.%y' )"
fi

# rsync the files

rsync -arz "$wkdir" "$bk1"

# test that they copied correctly and give prompt

if [[ $(diff -qr $wkdir $bk1) = "$test" ]]; then
    echo "Files successfully backed up"
else
    echo "File did not successfully back up"
    exit 1
fi

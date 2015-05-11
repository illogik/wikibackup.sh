#!/bin/bash

# Script name: wikibackup.sh
# Author: Antonio Perretta
# Created on: 05/11/15
# Description: A short script to backup my wiki


# setting variables

wiki_dir=/cygdrive/e

backup_dir=/cygdrive/d/backups/wiki


# test to see if there is a backup file for today and create if there isnt

if [[ -f "$backup_dir"/"$( date '+%m.%d.%y' )" ]]; then
    read -p "A backup file for today allready exists. Would you like to overwrite? (y/n) > " response1
        if [[ "$response1" != "y" ]]; then
            echo "Exiting"
            exit 1
        fi
    else mkdir "$backup_dir"/"$( date '+%m.%d.%y' )"
fi


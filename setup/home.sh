#!/usr/bin/env bash

# move into setup dir, source logging
source $(dirname $BASH_SOURCE)/logging.sh

function backup() {
    if [[ ! -e $BACKUP_DIR ]]; then
        info "Backup directory at \"$BACKUP_DIR\" does not exist. Creating..."
        mkdir -p $BACKUP_DIR
    fi

    warn "\"$1\" already exists - creating backup."
    mv $1 $BACKUP_DIR
}

# Get abs path for dotfiles/home
HOME_SRC=`cd "$(dirname $BASH_SOURCE)/../home" && pwd`

# GET the abs path for ~
HOME_DEST=`cd && pwd`

# create a backup directory of files
# ts=`date "+%Y-%m-%d %H:%M:%S"`
BACKUP_DIR="$HOME_DEST/.backups/home/`date "+%Y-%m-%dT%H:%M:%S"`"

# include hidden files
shopt -s dotglob

cd $HOME_SRC
for file in *; do
    dest="$HOME_DEST/$file"
    src="$HOME_SRC/$file"

    if [[ -e $dest ]]; then
        if [ "$(readlink $dest)" = "$src" ]; then
            info "Link from \"$src\" to \"$dest\" already exists."
        else
            backup $dest
            ln -s $src $dest
        fi
    else
        info "Linking \"$src\" to \"$dest\"."
        ln -s $src $dest
    fi
done

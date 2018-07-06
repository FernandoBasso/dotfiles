#!/usr/bin/env bash

cd "$HOME" || exit 1

check_me='/etc/os-release'
if [ -f "$check_me" ] && grep -q 'NAME=.*Ubuntu.*' "$check_me" ; then
    dest='/media/fernando/5d737d73-4fed-4787-9795-873873e2a45e/Fernando/BackupSensitive/'
elif [ "$(hostname)" == 'theforce' ] ; then
    dest='/run/media/fernando/5d737d73-4fed-4787-9795-873873e2a45e/Fernando/BackupSensitive/'
elif [ "$(hostname)" == 'work1' ] ; then
    dest='/run/media/fbasso/5d737d73-4fed-4787-9795-873873e2a45e/Fernando/BackupSensitive/'
fi

if [ -z "$dest" ] || [ ! -w "$dest" ] ; then
    printf '%s\n' 'Ensure that dest exists and is writaable by you.' 1>&2
    exit 1
fi

function usage () {
    exit_status=0

    if [ -n "$1" ] ; then
        exit_status="$1"
    fi

    cat << EOF

USAGE: ${0%%/*} [--backup]

OPTIONS:

    --backup    don't do an rsync dry run, *really* perform the backup.

NOTE:

If the destionation seems to be missing files, remember
that we are making a backup of several dot files and
directories (aka hidden files).

    ls -A $dest
EOF

    exit "$exit_status"
}

#
# Dry run by default.
#
dryrun=--dry-run

# If there is a $1 and it is not --backup, we assume
# the user is unaware of the implications and consider
# it an error.
if [ -n "$1" ] ; then
    if [ "$1" == --backup ] ; then
        dryrun=''
    else
        usage 1
    fi
fi

#
# --archive implies: archive mode; equals -rlptgoD (no -H,-A,-X)
#   -r --recursive
#   -p --perms
#   -t --times
#   -g --group
#   -o --owner
#   -D same as --devices --special
#

rsync \
    "$dryrun" \
    --archive \
    --verbose \
    --itemize-changes \
    --filter='+ .ssh/' \
    --filter='+ .ssh/***' \
    --filter='+ .gnupg/' \
    --filter='+ .gnupg/***' \
    --filter='+ .config/' \
    --filter='+ Documents/' \
    --filter='+ Documents/GPG/' \
    --filter='+ Documents/GPG/***' \
    --filter='+ .config/filezilla/' \
    --filter='+ .config/filezilla/***' \
    --filter='- *' \
    "$HOME/" "$dest"

printf '\n%s:\n\n  %s\n' 'Backup made into directory' "$dest"


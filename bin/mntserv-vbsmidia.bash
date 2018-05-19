#!/usr/bin/env bash

my_dirs=(~/ServDev ~/ServProd ~/ServTemp)

#
# TODO: Check if `mountpoint` command is available on the system.
#

usage() {
    echo "Usage: ${0##*/} --(on|off)"
}

do_mount() {
    for my_dir in "${my_dirs[@]}" ; do
        if mountpoint -q "$my_dir" ; then
            echo "~/${my_dir##*/} already mounted."
        else
            echo -n "Mounting ~/${my_dir##*/}..."
            mount "$my_dir"
            echo ' Done!'
        fi
    done
}

do_umount() {
    for my_dir in "${my_dirs[@]}" ; do
        if mountpoint -q "$my_dir" ; then
            echo -n "Umounting ~/${my_dir##*/}..."
            umount "$my_dir"
            echo ' Done!'
        else
            echo "~/${my_dir##*/} is not mounted."
        fi
    done
}

if [[ -z $1 ]] ; then
    usage
    exit 1
fi

case $1 in
    '--on')
        do_mount
        ;;
    '--off')
        do_umount
        ;;
    *)
        usage
        ;;
esac


#
# In the shell, 0 is truthy, all other values indicate some form of falsiness
# or type of error.
# http://stackoverflow.com/questions/2933843/why-0-is-true-but-false-is-1-in-the-shell
#



# $ bash mntserv --on
# ~/ServDev already mounted.
# ~/ServProd already mounted.
# ~/ServTemp already mounted.
# 
# ~/bin/ →  09:01:03 ✓ 
# $ bash mntserv --off
# Umounting ~/ServDev... Done!
# Umounting ~/ServProd... Done!
# Umounting ~/ServTemp... Done!
# 
# ~/bin/ →  09:01:30 ✓ 
# $ bash mntserv --on
# Mounting ~/ServDev... Done!
# ~/ServProd already mounted.
# Mounting ~/ServTemp... Done!
# 
# ~/bin/ →  09:01:40 ✓ 
# $ bash mntserv --off
# Umounting ~/ServDev... Done!
# Umounting ~/ServProd... Done!
# ~/ServTemp is not mounted.


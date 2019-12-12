#!/usr/bin/env bash

#
# Copies files from my dotfiles repository several places
# on $HOME.
#
# Assumes rsync is installed.
#
# On Arch Linux:
#
#   pacman -S rsync --needed
#
# TODO: create a setup_emacs function as well since I also use emacs.
#

function usage() {

    cat << EOF

Usage: ${0%/*} --sync|--dry-run

OPTIONS:

    --sync, -s    Really copy files to their destination.
    --dry-run, -d   Only pretend to see what would be copied.
    --setup-vim     Install Plug and run PlugIntall.

WARNING:

    Running this script with the '--sync' option will pottentially override
    files. So, know what you are doing. No backups will be made.

    Consider running with '--dry-run' before really going for '--sync'.

    You have been warned!
EOF

exit 0
}

function mkdirs () {
    # Used for vim tmp/bkp files.
    mkdir --verbose --parents ~/Temp/vim_{tmp,bkp}
}

#
# Clone plug.vim into vim's autoload directory. You can use
# this from time to time to fetch newer versions of Plug
# and make Plug update its managed plugins as well.
#
function setup_vim () {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    vim -c 'PlugInstall'
}

#
# Takes on argument which is either --sync or --dry-run.
#
function sync () {

    case "$1" in
        --sync)
            mkdirs
            dryrun=''
            ;;
        --dry-run)
            dryrun=--dry-run
            ;;
        *)
            usage
            ;;
    esac

    # If '$dryrun' is empty, rsync will __really_ copy files.
    # If it is '--dry-run', rsync will only pretend.
    rsync \
        "$dryrun" \
        --filter='- .git/' \
        --filter='- sync.sh' \
        --filter='- README.md' \
        --filter='- tmp_vim/' \
        --filter='- tmp/' \
        --filter='- bin/' \
        --filter='- imgs/' \
        --filter='- bash_incl/' \
        --archive \
        --no-perms \
        --verbose \
        --human-readable \
        --itemize-changes \
        ./ ~/
    }

case "$1" in
    --sync|-s)
        sync --sync
        ;;
    --dry-run|-d)
        sync --dry-run
        ;;
    --setup-vim)
        setup_vim
        ;;
    *)
        usage
        ;;
esac


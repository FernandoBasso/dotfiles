#!/usr/bin/env bash

if [[ "$TERM" != xterm-kitty ]] ; then
  printf '%s\n' \
    'This script can only be used from Kitty terminal emulator' \
    1>&2

  exit 1
fi

##
# A script to remote-control kitty and set some windows and tabs to a
# FRONT-END DEVEL setup for vim, jest, server and a split window for
# shell commands and/or man pages.
#

##
# Default title and working directory if not passed. I'll keep this
# simple for now. To pass a working directory, the tittle has to be
# passed to. First param is always the title, second param is always the
# working directory. To use the default title and still be able to pass
# the directory as the second parameter, pass '' as the first param
#
# Examples:
#
# $ bash kitty-dev-fe.sh MY-FRONTEND-APP \
#   ~/work/purescript-apps/todoapp
#
# $ bash kitty-def-fe.sh '' \
#   ~/work/react-apps/blog
#
#
win_title='λ H4CK1N9 λ' work_dir=~/Public

##
# If passed, let's set the custom window title.
#
if [[ -n "$1" ]]; then
  win_title="$1"
fi

if [[ -n "$2" ]]; then
  work_dir="$2"
fi

##
# The editor, jest unit ests and server tabs.
#
kitty @ launch --cwd "$work_dir" --title "$win_title" \
  --type=tab --tab-title vim

kitty @ launch --cwd "$work_dir" --title "$win_title" \
  --type=tab --tab-title jest

kitty @ launch --cwd "$work_dir" --title "$win_title" \
  --type=tab --tab-title serv

##
# Opens a new tab, and then another kitty window on the right.
#
kitty @ launch --cwd "$work_dir" --title "$win_title" \
  --type=tab --tab-title shell

kitty @ launch --cwd "$work_dir" --title "$win_title"

##
# Focus the shell on the right tab and run ‘git status’ on it.
# Run ‘git status’ on the right shell window (num 1) and
# then focus that tab at window num 0.
#
kitty @ focus-tab -m title:shell
kitty @ send-text -m num:1 'ls\n'

kitty @ focus-window -m num:0

##
# Then close the first (original) tab/window that was open
# just so that we could launch the layout. This relies on my
# kitty setup which sets a new kitty window with the default
# title of “λ Always Be Awesome! λ”.
#
#
kitty @ close-tab -m title:'λ Always Be Awesome! λ'

#
# vim: set tw=72:
#

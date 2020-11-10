#!/usr/bin/env bash

##
# Paste Image From Clipboard - Thunar Custom Action
# =================================================
#
# Make sure ‘xclip’ is installed, place this script in a directory like
# $HOME/bin/. Then in Thunar navigate to “Edit” → “Configure Custom
# Actions”, click the “+” (plus) button/icon and fill in the fields:
#
# • Name: Paste Image From Clipboard;
# • Description: Anything you like or leave empty;
# • Command: Something like:
#     /home/<your-user>/bin/paste-image.sh %f
#   ...or click the directory file chooser to find and set the shell
#   script path.
# • Set a keybinding to something like F3 or whatever.
# • On the “Appearance Conditions” tab make sure “File Pattern” is “*”
# and “Appears if selection contains “[✔] Directories”.
#
# Now you should be able to copy an image to the clipboard and paste it
# to the current Thunar directory either by right-click context menu or
# by triggering your chosen keyboard shortcut.
##

xclip \
  -selection clipboard \
  -t image/png -o \
  > "$(date +'%Y-%m-%d-%H-%M-%S'-my-image.png)"

##
# vim: set tw=72:
##

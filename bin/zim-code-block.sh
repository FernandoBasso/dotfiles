#!/usr/bin/env bash

#
# USAGE
# -----
# First, make the script available in Zim Custom Tools:
#
# - Go to Tools → Custom Tools → Add (icon).
#   - Name: “Code Block”.
#   - Description: “Insert code block delimiter”.
#   - Command: ‘~/Projects/dotfiles/bin/zim-code-block.sh %T’
#   - Check “Output should replace current selection“ (it has to be
#     checked no matter if you will later apply it on selected
#     text or not).
#   - Check “Show in the Toolbar.
# - Go to Edit → Preferences → Key bindings and set a shortcut like
#   ‘Ctrl-\’ to <Actions>/custom_tools/code block-usercreated.
#
# Then, to actually insert the delimters or wrap text with them,
# either just hit ‘Ctrl-\’ (or from Tools → Code Block) or first
# select some text before applying the script.
#

#
# If we have been passed the selected text. That is the ‘%T’ option
# in the instructions above. Wrap selection with delimiters.
#
if [ $# -eq 1 ] ; then
    printf '%s\n%s\n%s\n%s\n%s\n'   "'''" "----" "$1" "----" "'''"
else
    #
    # No selection. Just insert the delimiters.
    #
    printf '%s\n%s\n\n%s\n%s\n'   "'''" "----" "----" "'''"
fi


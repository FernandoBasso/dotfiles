# vim: set filetype=sh:

#
# NOTE: In an attempt to make my functions easy to use, they all start
# with _0- so I can type _0<Tab> and see the possible completions for
# my own functions. Could do the same with aliases, either using the same
# _0- or something else which is different enough from all the rest of
# command line utilities and programs.
#

# Shows only files that are not directories.
lsf() { /bin/ls -F1 "$@" | grep -E -v '/$'| sort -d; }

# Sets title for rxvt-unicode.
# @param string $1 - the title.
_0-title-urxvt () {
    #unset PROMPT_COMMAND
    printf "\033]2;%s\007" "$1"
}

#
# Uses default title if one is not passed as param.
#
_0-title-term () {
    title="λ ${1:-Always Be Awesome!} λ"
    shift
    # update title
    PROMPT_COMMAND='echo -ne "\033]0; $title \007"'
}

##
# Run ‘tree’ with colors on a directory and pipe it to less.
#
# ‘tree -C’ produces colors. ‘less -R’ honors that colors and displays
# them nicely instead of outputting escape sequences in plain text.
# Cool, huh‽ 😄
#
# @param {str} path - The path to list in tree format.
#
# @examples:
#
#   $ t src
#   $ t /boot/
#   $ t ~/Projects/tmuxsitter
#
t () {
	tree -CF "$1" | less -R
}


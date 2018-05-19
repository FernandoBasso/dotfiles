#!/usr/bin/env bash

# TODO: Display array of available fonts in a help command.

function usage() {
    printf '%s\n' "USAGE: ${0##*/} FONT [SIZE]"
    printf '%s\n' 'SIZE is optional and the default is 18.'
    printf '%s\n' 'EXAMPLES:'
    printf '\t%s %s\n' "${0##*/}" 'ubuntu'
    printf '\t%s %s\n' "${0##*/}" 'inconsolata'
}

if (( $# < 1)) ; then
    usage
    exit 1
fi

font="${1}"
size="${2:-18}"

default_font_set='xft:Inconsolata:pixelsize=19:style=regular:antialias=true,xft:Ubuntu Mono:pixelsize=19:style=medium:antialias=true,xft:Source Code Pro:pixelsize=16:style=medium:antialias=true,xft:Dejavu Sans Mono:pixelsize=16style=medium:antialias=true,xft:Noto Sans Symbols2:pixelsize=14:style=medium:antialias=true,xft:-*-unifont-*-*-*-*-*-*-*-*-*-*-*-*'

available_fonts=(
    'Ubuntu Mono'
    'Inconsolata'
    'Source Code Pro'
    'Monofur'
)

# @param font name
# @param font size
function make_font () {

    for ((i=0; i < "${#available_fonts[@]}"; ++i)) ; do
        cur_font="${available_fonts[i]}"

        if [[ "${cur_font,,}" =~ "$1" ]] ;  then
            echo "xft:${cur_font}:pixelsize=${2}:style=regular:antialias=true"
            exit 0
        fi
    done
}

#
# @param $1 font name
# @param $2 font size
#
function launch_terminal () {
    user_font=$(make_font $1 $2)
    fonts="${user_font}\,${default_font_set}"
    echo $fonts
    urxvt -name dark1 -tr -sh 15 -fn "$fonts" -fn "$fonts" -fi "$fonts" -fbi "$fonts"
    exit 0
}

case $1 in
    ubuntu|inconsolata|'source code pro'|droid|monofur)
        launch_terminal $font $size
        break
        ;;
    *)
        printf '%s\n' 'I do not understand. Bailing...'
        exit 0
        ;;
esac


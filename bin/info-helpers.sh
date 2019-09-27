#!/usr/bin/env bash

function usage () {
    script_name=${0##*/}

    cat << EOF

  Lists the menus of a program which provides info pages.

  USAGE

    $script_name [OPTION]... PROGRAM

  OPTIONS
    --menus     A list of info PROGRAM main menus

  EXAMPLES

    $script_name sed
    $script_name emacs
    $script_name find
EOF

    exit 1
}


if [ -z "$1" ] || [ -z "$2" ] ; then
    usage
fi


function titlefy () {
    title="‘${1}’ info menu index"
    pad=$(printf '%0.1s' ={1..120})
    remaining=$(( 80 - "${#title}" ))
    padlen=$(( remaining / 2 ))
    printf '%.*s %s %.*s\n' $padlen "$pad" "$title" $padlen "$pad"
}


#
# Gets a string and makes a line-like string of the length
# of the passed string.
#
function linefy () {
    printf '%s' "$1" | sed 's/./=/g'
}


function info_parse_index () {
    printf '%s' "$( info "$1" --output - | grep '^\*\s.\+::' )"
}


function list_menus () {
    title=$(titlefy "$1")

    printf '\n%s\n' "$( linefy "$title" )"
    printf '%s\n' "$title"
    printf '%s\n' "$( linefy "$title" )"

    printf '\n%s\n' "$( info_parse_index "$1" )"
}

case "$1" in
    -h|--help)
        usage
        ;;
    --menus)
        list_menus "$2"
        ;;
    *)
        usage
        ;;
esac


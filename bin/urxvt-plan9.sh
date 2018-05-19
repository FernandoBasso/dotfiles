#!/usr/bin/env bash
# Create an urxvt window plan9-style.
# Requires slop and xdotool.
# Author: eti, #rxvt-unicode.

# vars
wd="6"
hd="15"

# exec
read "w" "h" "x" "y" < <(slop -l -b "5" -c "1 1 1 0" -f "%w %h %x %y")

pw="$(printf $(( "$w" / "$wd" )) )"
ph="$(printf $(( "$h" / "$hd" )) )"

urxvt -g "$pw"x"$ph"+"$x"+"$y" &
sleep ".1s"
xdotool windowsize "$(xdotool "getactivewindow")" "$w" "$h"

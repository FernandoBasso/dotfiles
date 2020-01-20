#!/usr/bin/env bash

#
# This script sets all available CPUs to either
# 'performance' (for playing games, for instance)
# or 'powersave'.
#
# I Made this script based on the information from:
#
# https://support.feralinteractive.com/docs/en/riseofthetombraider/1.0.3/linux/faqs/#i_cpu_governor
#
# Instead of this script, you may want to use the 'gamemode' (open source)
# tool by Feral Interactive:
#
# https://github.com/FeralInteractive/gamemode
#
# Way to go, Feral!
#
# USAGE:
# ------
#
# Download this script and save it as `cpu_governor.sh` then
# just run it like this:
#
#     bash cpu_governor.sh --performance
#
# or
#
#     bash cpu_governor.sh --powersave
#
# Of course, if you have more experience with Linux, you can also make it
# executable, add it your some directory in your PATH and just run it like
# any other command.
#
# NOTE: This script assumes you have `tr', `sed', `wc' and `bash' at least
# version 3.2 installed. This should be the no problem for any Linux
# distribution as of 2018.
#
# NOTE: We also assume you have `sudo' installed and you are in a group that
# allows you to used `sudo'. This is the default on Ubuntu and derived distros.
# For Arch Linux (also useful for other distros), check:
#
# https://wiki.archlinux.org/index.php/sudo
#
# Checking the current mode
# -------------------------
#
# To check in which mode your CPUs are currently in, check one
# of your CPUs, example:
#
#     cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
#

usage () {

    script_name=${0##*/}

cat << TOMBRAIDER
Run with: ‘%s’ or ’%s’\n' '--powersave' '--performance'

Examples:

    $script_name --performance
or

    $script_name --powersave

You may also use '--dry-run' as the second argument, in
which case no real configurations will be made, but the
script will just print what it _would_ do:

    $script_name --performance --dry-run
or

    $script_name --powersave --dry-run
TOMBRAIDER

    exit 0
}

if [[ $# < 1 ]] ; then
    usage
fi

mode=''

case "$1" in
    --po*)
        mode=powersave
        ;;
    --pe*)
        mode=performance
        ;;
    *)
        usage
        ;;
esac

try=''
if [[ "$2" == '--dry-run' ]]; then
    try='--dry-run'
fi

# Replace tabs with spaces.
# Squeeze multiple spaces to one space.
# Match lines '^processor : <num>$'. Not all SEDs support `[0-9]\+'.
# Count those lines.
# Delete '\n' produced by previous command.
num_processors=$(cat /proc/cpuinfo \
    | tr '\t' ' ' \
    | tr -s ' ' \
    | sed -n '/^processor : [0-9][0-9]*/p' \
    | wc --lines \
    | tr -d '\n')

# Perform the actuall config.
for (( num = 0; num < $num_processors; num++ )) ; do
    if [[ $try =~ --dry-run ]] ; then
        printf "Would set CPU '%d' to '%s'\n" $num $mode
        printf "echo \"$mode\" | sudo tee \"/sys/devices/system/cpu/cpu${num}/cpufreq/scaling_governor\n"
    else
        printf "Setting CPU '%d' to '%s'\n" $num $mode
        echo "$mode" | sudo tee "/sys/devices/system/cpu/cpu${num}/cpufreq/scaling_governor"
    fi
done


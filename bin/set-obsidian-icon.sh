#!/bin/bash

##
# As of 2026, on Arch Linux, Install wmctrl (extra) and xseticon (AUR).
##

icon=/usr/share/icons/hicolor/512x512/apps/obsidian.png

if [[ -n "$1" ]]
then
	icon="$1"
fi

##
# An array of running Obsidian instances.
# #
mapfile -t apps < <(wmctrl -lx | grep -i md.obsidian)

if [[ $DEBUG == 1 ]]
then
	printf '\nDEBUG: Running instances:\n\n'
	printf '  • %s\n' "${apps[@]}"
	printf '\n'
fi

app_ids=()

##
# Loop and exctract only the IDs.
#
for app in "${apps[@]}"
do
	app_id=$(cut -d ' ' -f 1 <<<"$app")
	app_ids+=("$app_id")
done

if [[ $DEBUG == 1 ]]
then
	printf '\nDEBUG: Running instance IDs:\n\n'
	printf '  • %s\n' "${app_ids[@]}"
	printf '\n'
fi

##
# Loop and set the icon for each instance.
#
for app_id in "${app_ids[@]}"
do
	xseticon -id "$app_id" "$icon"
done

if [[ $DEBUG == 1 ]]
then
	printf \
		'\nDEBUG: Set the icon for the %d running Obsidian instances:\n\n' \
		"${#apps[@]}"
	printf '  • %s\n' "${apps[@]}"
	printf '\n'
fi


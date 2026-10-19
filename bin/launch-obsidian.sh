#!/bin/bash

##
# Install xseticon from AUR and wmctrl from extra.
#
# Use this script with ~/.local/share/applications/obsidian.desktop
#
# Sample obsidian.desktop
cat <<'EOF' 1> /dev/null
[Desktop Entry]
Name=Obsidian
Exec=/home/your-user/source/dotfiles/bin/launch-obsidian.sh
Icon=obsidian
Terminal=false
Type=Application
StartupWMClass=md.obsidian.Obsidian
Category=Office
MimeType=application/pdf;text/markdown;application/x-obsidian-canvas;application/x-obsidian-base;x-scheme
EOF


# Start obsidian as a background process for this shell session so that
# the next lines run without having to wait for obsidian to stop running
# first.
#
obsidian &

##
# Give some time so that Obsidian is fully ready.
#
sleep 4

__obsidian_window_id=$(wmctrl -lx | grep md.obsidian | cut -d ' ' -f 1)

if [[ $DEBUG == 1 ]]
then
	printf '\nObsidian Window ID: %s' "$__obsidian_window_id"
fi

##
# Set the icon on the window with the found window id.
#
xseticon \
	-id "$__obsidian_window_id" \
	/usr/share/icons/hicolor/512x512/apps/obsidian.png


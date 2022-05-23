#!/usr/bin/env bash

##
# Downloads the AppImage (works on Linux) and saves it to
#
# https://github.com/xournalpp/xournalpp/releases
#
# Example of download URL:
#
# https://github.com/xournalpp/xournalpp/releases/download/nightly/xournalpp-1.1.1+dev-nightly.20220523-x86_64.AppImage
##

url=https://github.com/xournalpp/xournalpp/releases/download/nightly

app=xournalpp
version='1.1.1+dev-nightly'
release_date="$(date +'%Y%m%d')"
arch=x86_64
ext=AppImage
download_url="${url}/${app}-${version}.${release_date}-${arch}.${ext}"
output="$HOME/bin/xournal-nightly.AppImage"

printf '\n%s\n\n' "$download_url" "$comp"

##
# Create directory in case it does not exist.
#
mkdir -pv ~/bin

##
# Download the AppImage.
#
\curl -#L "$download_url" -o "$output"

##
# Make it executable for the user so I can easily open it through
# Xfce4 Application Finder, gmrun, a shell or a keyboard shortcut.
#
chmod u+x "$output"


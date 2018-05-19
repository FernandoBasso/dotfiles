#!/usr/bin/env bash

dir="${HOME}/WorkSRC/siteskel"
ses='siteskel'

# Debian/Xubuntu
apache_unit=apache2.service
mariadb_unit=mysql.service

# Archlinux machine (probably for Fedora and CentOS as well).
if [ $HOSTNAME = theforce ] ; then
    apache_unit=httpd.service
fi
services=($apache_unit $mariadb_unit)


if [ ! -d "$dir" ] ; then
    echo "Directory \`$dir\` not found."
    echo "The project “$ses” doesn't seem to be on this machine."
    echo "Bailing out..."
    exit 0
fi

for service in "${services[@]}" ; do
    echo $service
    if systemctl --quiet is-active $service = 0 ; then
	echo "${service} is already running."
    else
	echo "Starting ${service}..."
	sudo systemctl start $service
    fi
done


# NOTE: base-index is set to 1 (relevant for the window numbers in commands).

tmux new-session -d -s "$ses" -c "$dir" \; rename-window 'vim' \; \
    send-keys 'vim app.php' C-m

# php -S takes a host name, without the protocol:// part.
tmux new-window -t "${ses}:2" -n 'php -S' -c "$dir" \; \
    send-keys 'php -S dev.local.me:8080' C-m

tmux new-window -t "${ses}:3" -n 'sass' -c "$dir" \; \
    send-keys 'sass --watch scss:css' C-m

tmux new-window -t "${ses}:4" -n 'git' -c "$dir" \; \
    send-keys 'git branch ; git status' C-m

# With LC_COLLATE=C we list dot files first.
tmux new-window -t "${ses}:5" -n 'shell' -c "$dir" \; \
    send-keys 'LC_COLLATE=C \ls --color=auto --format=long --human-readable --almost-all --classify' C-m

tmux select-window -t "${ses}:1"
tmux -2 attach-session -t "${ses}"


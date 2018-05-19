#!/usr/bin/env bash

dir="${HOME}/develop/projs/pizzasite"
ses='pizza-site'

# Debian/Xubuntu
apache_unit=apache2.service
postgresql_unit=postgresql.service
mariadb_unit=mysqld.unit

# Archlinux machine (probably for Fedora and CentOS as well).
if [ $HOSTNAME = theforce ] ; then
    apache_unit=httpd.service
    mariadb_unit=mysqld.service
fi

# Services we need to start for this project.
services=($mariadb_unit)

if [ ! -d "$dir" ] ; then
    echo "Directory \`$dir\` not found."
    echo "The project “$ses” doesn't seem to be on this machine."
    echo "Bailing out..."
    exit 0
fi

for service in "${services[@]}" ; do
    if systemctl --quiet is-active $service = 0 ; then
        echo "${service} is already running."
    else
        echo "Starting ${service}..."
        sudo systemctl start $service
    fi
done


# NOTE: base-index is set to 1 (relevant for the window numbers in commands).

tmux new-session -d -s "$ses" -c "$dir" \; rename-window 'vim' \; \
    send-keys 'vim src/AppBundle/Controller/HomeController.php' C-m

# php -S takes a host name, without the protocol:// part.
tmux new-window -t "${ses}:2" -n 'server' -c "$dir" \; \
    send-keys 'php bin/console server:run' C-m

tmux new-window -t "${ses}:3" -n 'sass' -c "$dir" \; \
    send-keys 'sass --watch web/scss/:web/css/' C-m

tmux new-window -t "${ses}:4" -n "logs" -c "$dir" \; \
    send-keys 'tail -f var/logs/dev.log' C-m

tmux new-window -t "${ses}:5" -n 'git' -c "$dir" \; \
    send-keys 'git branch ; git status' C-m

# With LC_COLLATE=C we list dot files first.
tmux new-window -t "${ses}:6" -n 'shell' -c "$dir" \; \
    send-keys 'LC_COLLATE=C \ls --color=auto --format=long --human-readable --almost-all --classify' C-m

tmux select-window -t "${ses}:1"
tmux -2 attach-session -t "${ses}"



#!/usr/bin/env bash

dir="${HOME}/develop/VBSMidia/vbserp"
dirbe="$dir/backend"
dirfe="$dir/frontend"
ses='vbserp'
sesbe="${ses}-backend"
sesfe="${ses}-frontend"

# Debian/Xubuntu
#apache_unit=apache2.service
mariadb_unit=mysql.service

# Archlinux machine (probably for Fedora and CentOS as well).
if [ $HOSTNAME = theforce ] ; then
    apache_unit=httpd.service
fi
services=($mariadb_unit)


if [ ! -d "$dir" ] ; then
    echo "Directory \`$dir\` not found."
    echo "The project “$ses” doesn't seem to be on this machine."
    echo "Bailing out..."
    exit 1
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

#
# BACKEND
#
tmux new-session -d -s "$sesbe" -c "$dirbe" \; rename-window 'vim' \; \
    send-keys 'vim routes/web.php'

# The frontend stuff is served by this php server, so, we need
# this to run e2e tests on the frontend, even in development mode.
tmux new-window -t "${sesbe}:2" -n 'server' -c "$dirbe" \; \
    send-keys 'php artisan serve --host=dev.local.me --port=8181 -vvv' C-m

tmux new-window -t "${sesbe}:3" -n 'tinker' -c "$dirbe" \; \
    send-keys 'php artisan tinker'

tmux new-window -t "${sesbe}:4" -n 'sqldev' -c "$dirbe" \; \
    send-keys 'mysql -u devel -h dev.local.me -p -D vbserp_devel -A'

tmux new-window -t "${sesbe}:5" -n 'unit' -c "$dirbe" \; \
    send-keys "alias phpunit=${PWD}/vendor/phpunit/phpunit/phpunit" C-m \; \
    'phpunit'

tmux new-window -t "${sesbe}:6" -n 'git' -c "$dirbe" \; \
    send-keys 'git status' C-m


#
# FRONTEND
#
tmux new-session -d -s "$sesfe" -c "$dirfe" \; rename-window 'vim' \; \
    send-keys 'vim src/main.js'

tmux new-window -t "${sesfe}:2" -n 'webpack' -c "$dirfe" \; \
    send-keys 'npm run watch' C-m

tmux new-window -t "${sesfe}:3" -n 'unit' -c "$dirfe" \; \
    send-keys 'npm run unit'

tmux new-window -t "${sesfe}:4" -n 'e2e' -c "$dirfe" \; \
    send-keys 'npm run e2e'

tmux new-window -t "${sesfe}:5" -n 'git' -c "$dirfe" \; \
    send-keys 'git status' C-m


#
# Attach to backend session by default. `C-a s' to navigate between sessions.
#
tmux select-window -t "${sesbe}:1"
tmux -2 attach-session -t "${sesbe}"



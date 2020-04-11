#!/usr/bin/env bash

#
# Vim Helpers
# ===========
#


script_name=${0##*/}

usage () {

cat << TOMBRAIDER1996

Available options:

 -k
 --close-all-servers  Close all vim servers currently running without
                      saving their buffers. You have been warned.

Usage example:

  $script_name --close-all-servers

TOMBRAIDER1996

  exit 0
}

vim_servers_close_all () {
  #
  # Get an array of all vim servers.
  #
  mapfile -t servers < <(vim --serverlist)

  if test "${#servers[@]}" -eq 0 ; then
    printf '%s\n' "[${script_name}/INFO] No servers to close."
  fi

  for server in "${servers[@]}"
  do
    #
    # Close all vim instances (servers) _without_ saving.
    # If the files were not saved and they needed to be,
    # it sucks to be you.
    #
    vim --servername "$server" --remote-send $'\e:quitall!<CR>'
    printf '[%s/INFO]: Closed “%s” vim server.\n' "$script_name" "$server"
  done
}


if [[ $# -lt 1 ]] ; then
  usage
fi

case "$1" in
  -k|--close-all-servers)
    vim_servers_close_all
    ;;
  *)
    usage
    ;;
esac


# vim: set softtabstop=2 shiftwidth=2:



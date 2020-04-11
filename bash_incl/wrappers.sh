
v_usage () {

  cat << EOF
‘v’ vim wrapper requires a ‘VIM-SERVER-NAME’ parameter.

Usage:

  v SESSION-NAME [FILE]...

Examples:

  v PLAYGROUND

  v DOTFILES ~/Projects/dotfiles/bin/backup.sh

  v CMDLINE -c NERDTree sed/intro.adoc
EOF

  return 0
}

v () {
  if [[ $# -lt 1 ]] ; then
    v_usage
    return 0;
  fi

  printf -v name '%s' "${2^^}"

  vim \
    -c 'colorscheme mylight1' \
    -c 'AirlineTheme xtermlight' \
    --servername "$name"
    "$@"
}

# vim: set softtabstop=2 shiftwidth=2:


#
# To be sourced in ‘~/.bashrc’.
#

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

  #
  # By default, assume ‘dark’.
  #
  TERM_THEME="${THEME:=dark}"
  VIM_THEME=mytheme1
  VIM_AIRLINE_THEME=wombat

  #
  # And if ‘light’, then we use light themes for vim and vim-airline.
  #
  if [ "$TERM_THEME" = light ] ; then
    VIM_THEME=mylight1
    VIM_AIRLINE_THEME=xtermlight
  fi

  printf -v name '%s' "${1^^}"

  #
  # “Remove” the SESSION-NAME parameter so only the remaining
  # parameters, if any, are passed to vim with the use of ‘$@’.
  #
  shift 1

  vim \
    --servername "$name" \
    -c "colorscheme $VIM_THEME" \
    -c "AirlineTheme $VIM_AIRLINE_THEME" \
    "$@"
}

# vim: set softtabstop=2 shiftwidth=2:


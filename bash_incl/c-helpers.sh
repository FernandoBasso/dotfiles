##
# Helpers for compiling and running simple C programs when Makefiles or
# some other build tool would be too much. I use these most for single
# file programs when I want to develop some idea or test some feature or
# something like t hat.
##

##
# Build a single C file.
#
# @param $1 - Some C file (.c file).
#
# This function builds a C file using the C 99 standard, with pedantic
# and all warnings options enabled and places the compiled code into the
# ‘build’ directory.
#
# Map it in vim like this:
#
#   :nnoremap <F5> :execute "!C_bf %"<CR>
#
# The ‘%’ in vim means “the current buffer”, which is exactly the first
# expected parameter to this function.
#
function C_bf () {
  source_file="$1"
  source_no_ext="${source_file%.c}"
  source_bare_name="${source_no_ext##*/}"

  gcc \
    -std=c99 \
    -pedantic -Wall \
    "$source_file" \
    -o "./build/$source_bare_name"
}

##
# We need to export it so we can run it from Vim shell commands.
#
export -f C_bf;

##
# Build and run a C file.
#
# @param $1 - Some C file (.c file).
#
function C_brf () {
  source_file="$1"
  no_ext="${source_file%.c}"
  bare_name="${no_ext##*/}"

  C_bf "$source_file" && "./build/$bare_name"
}

export -f C_brf

#
# vim: set tw=72:
#

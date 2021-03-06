# vim: set filetype=sh:

#
# Credits for this function:
# https://coderwall.com/p/ba8afa/git-branch-fuzzy-search-checkout
#

fbr() {
  local branches branch
  branches=$(git branch -a) &&
  branch=$(echo "$branches" | fzf +s +m) &&
  git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}


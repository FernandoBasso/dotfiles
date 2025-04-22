# vim: set filetype=sh:

#
# Credits for this function:
# https://coderwall.com/p/ba8afa/git-branch-fuzzy-search-checkout
#

_b() {
  local branches branch
  branches=$(git branch -a) &&
  branch=$(echo "$branches" | fzf +s +m) &&
  git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}


#
# • https://stackoverflow.com/questions/36513310/how-to-get-a-gits-branch-with-fuzzy-finder
#	• https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
#
# But these are already working for me without anything else besides
# having fzf and bash available.
#
# • CTRL-GCTRL-F: Files listed in git status
# • CTRL-GCTRL-B: Branches
# • CTRL-GCTRL-T: Tags
# • CTRL-GCTRL-H: Commit hashes
# • CTRL-GCTRL-R: Remotes
#

bell() {
#  $@
  echo -e "\07"
#  notify-send -i preferences-desktop-notification-bell -a "bell" "Command finished" "$(echo "$@")"
}

if installed nvim ; then
  alias vim="nvim"
  alias vi="nvim"
  alias vimdiff='nvim -d'
  export EDITOR=nvim
elif which vim >/dev/null ; then
  export EDITOR=vim
fi

if installed git ; then
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
  git config --global interactive.diffFilter "diff-so-fancy --patch"
  
  git config --global color.ui true

  git config --global color.diff-highlight.oldNormal    "red bold"
  git config --global color.diff-highlight.oldHighlight "red bold 52"
  git config --global color.diff-highlight.newNormal    "green bold"
  git config --global color.diff-highlight.newHighlight "green bold 22"

  git config --global color.diff.meta       "11"
  git config --global color.diff.frag       "magenta bold"
  git config --global color.diff.func       "146 bold"
  git config --global color.diff.commit     "yellow bold"
  git config --global color.diff.old        "red bold"
  git config --global color.diff.new        "green bold"
  git config --global color.diff.whitespace "red reverse"
fi

function fancydiff() {
  diff -u "$@" | diff-so-fancy
}
alias diff=fancydiff

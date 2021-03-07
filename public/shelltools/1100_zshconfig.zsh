# Opens ~/.zshrc (this file) with vim and executes "src" from the "zsh_reload" plugin
# (see above), if the file has been changed
zshconfig() {
  config_file=~/.zshrc
  oldcontent=$(<"$config_file")
  vim "$config_file"
  echo $oldcontent | diff -sq .zshrc - 2>&1 >/dev/null || src
} 

# The goal of this file is to have an almost identically looking prompt on all machines for both zsh and bash.
# When "source ~/.prompt" is placed in the .bashrc or .zshrc, it should look like this:
# <username>@<hostname>:<directory>$ <commands>
# The "@<hostname>" and "$" will be in grey, and the username and hostname will be in an accent color.
# The accent color can be chosen specifically for a specific combination of user, hostname and shell,
# and will be pseudo-randomly selected from an array of predefined colors otherwise.

# If the shell is not running interactively, we don't need to set a prompt and just return.
[[ $- != *i* ]] && return

# First find out the current shell
if grep -q -- "$0" /etc/shells ; then
  current_shell="$(basename "$0")"
else
  current_shell="$(basename "$SHELL")"
fi

# Set the profile identifier string. This will be <user>@<hostname>:<shell>
export profile_identifier="$USER"'@'"$(hostname)"':'"$current_shell"

# Declare an array of profile identifiers that map to specific colors
declare -A prompt_color_overrides
prompt_color_overrides["ruben@RUBENS-PC1:zsh"]="34"         # 34 = light green
prompt_color_overrides["ruben@RUBENS-PC2:zsh"]="34"         # 34 = light green
prompt_color_overrides["ruben@RUBENS-PC3:zsh"]="34"         # 34 = light green
prompt_color_overrides["ruben@RUBENS-PC1:bash"]="202"       # 202 = light red
prompt_color_overrides["ruben@RUBENS-PC2:bash"]="202"       # 202 = light red
prompt_color_overrides["ruben@RUBENS-PC3:bash"]="202"       # 202 = light red

# Get the color from the array. This may be empty if it wasn't specified above
export prompt_color_bash="${prompt_color_overrides["$profile_identifier"]}"

# If the color string is empty, generate the color from a cheap checksum of the profile identifier
if [ "$prompt_color_bash" = "" ] ; then
  # Setup an array with colors that look fine as a prompt color
  set -a prompt_colors
  prompt_colors_bash=( $(echo {1..6} {9..14} {26..32} {35..51} {70..87} {106..123} {126..129} {131..144} {146..159} {161..180} {183..187} {189..195} {198..229}) )
  # Generate the checksum and calculate the color integer via modulo with the number of allowed colors
  export prompt_color_bash="${prompt_colors_bash[$(( $(echo "$profile_identifier" | cksum | cut -d' ' -f1) % ${#prompt_colors_bash[@]} ))]}"
fi

# Set the color of the grey text
prompt_grey=248
# Set the prompt depending on the current shell
# This will be as stated above, but will be prepended with a bell character, so the console outputs a bell whenever a command finishes.
if [ "$current_shell" = "zsh" ] ; then
  # In ZSH, the color needs to be zero-padded to 3 characters
  export prompt_color_zsh="$(printf '%03d\n' "$prompt_color_bash")"
  PROMPT='%{$(echo "\a")%}%{$FG['"$prompt_color_zsh"']%}%n%{$FG['"$prompt_grey"']%}@%m:%{$FG['"$prompt_color_zsh"']%}%~%{$FG['"$prompt_grey"']%}$%{$reset_color%} '
elif [ "$current_shell" = "bash" ] ; then
  PS1='\007\[\033[38;5;'"$prompt_color_bash"'m\]\u\[\]\[\033[38;5;'"$prompt_grey"'m\]@\h:\[\]\[\033[38;5;'"$prompt_color_bash"'m\]\w\[\]\[\033[38;5;'"$prompt_grey"'m\]\$\[\]\[\033[38;5;15m\] \[\]'
fi

 

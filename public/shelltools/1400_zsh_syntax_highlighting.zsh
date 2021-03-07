# Custom array for colors
typeset -A one_dark_colors
one_dark_colors[bright_red]='#e06c75'
one_dark_colors[bright_gray]='#abb2bf'
one_dark_colors[bright_green]='#98c379'
one_dark_colors[dark_red]='#be5046'
one_dark_colors[purple]='#c678dd'
one_dark_colors[orange]='#d19a66'
one_dark_colors[teal]='#56b6c2'
one_dark_colors[blue]='#61afef'

# Select predefined highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Apply custom colors to predefined highlighters
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=${one_dark_colors[dark_red]}"
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg='"${one_dark_colors[purple]}"',bold'
ZSH_HIGHLIGHT_STYLES[builtin]="fg=${one_dark_colors[teal]}"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=${one_dark_colors[bright_green]}"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=${one_dark_colors[blue]}"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=${one_dark_colors[orange]}"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=${one_dark_colors[orange]}"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=${one_dark_colors[bright_green]}"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=${one_dark_colors[bright_green]}"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=${one_dark_colors[bright_green]}"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]="fg=${one_dark_colors[dark_red]}"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]="fg=${one_dark_colors[dark_red]}"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]="fg=${one_dark_colors[dark_red]}"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=${one_dark_colors[bright_red]}"
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg=${one_dark_colors[blue]},underline"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=${one_dark_colors[blue]},underline"
ZSH_HIGHLIGHT_STYLES[arg0]="fg=${one_dark_colors[blue]}"
ZSH_HIGHLIGHT_STYLES[assign]="fg=${one_dark_colors[bright_red]}"
ZSH_HIGHLIGHT_STYLES[bracket-error]="fg=${one_dark_colors[dark_red]}"

# Define additional highlighters for "$", "=" and "in"
typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_PATTERNS+=('$' 'fg='"${one_dark_colors[dark_red]}")
ZSH_HIGHLIGHT_PATTERNS+=('=' 'fg=#ffffff')
ZSH_HIGHLIGHT_PATTERNS+=(' in ' 'fg='"${one_dark_colors[purple]}"',bold')

ZSH_HIGHLIGHT_STYLES[comment]="fg=${one_dark_colors[bright_gray]}"

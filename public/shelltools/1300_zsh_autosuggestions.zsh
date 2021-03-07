# Adding widgets for accept-line* to this array will make the suggestion
# disappear if the autosuggestion is actually not used
# Otherwise the suggestion would be printed out in normal color and make it look
# like it was accepted
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(accept-line accept-line-or-clear-warning) 

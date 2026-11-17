#!/bin/sh
is_zsh || return 1

# Page Up and Down search history for commands starting with the typed text.
# Loaded after zim, so this overrides the input module's up/down-line-or-history.
bindkey "^[[5~" history-search-backward
bindkey "^[[6~" history-search-forward

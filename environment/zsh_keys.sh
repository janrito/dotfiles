#!/bin/sh
is_zsh || return 1

# home and end keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Make Page Up and Down intelligently go through history
bindkey "^[[5~" history-search-backward
bindkey "^[[6~" history-search-forward

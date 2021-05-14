is_zsh || return 1

# kill line
bindkey \^K kill-line

# home and end keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Make Page Up and Down intelligently go through history
bindkey "^[[5~" history-search-backward
bindkey "^[[6~" history-search-forward

## Enable Alt-arrows word hopping
bindkey "^[b" backward-word # Alt left
bindkey "^[f" forward-word # Alt right

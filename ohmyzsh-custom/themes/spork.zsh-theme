autoload -Uz colors &&   colors

ZSH_THEME_GIT_PROMPT_PREFIX="${fg[green]}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${reset_color}"
ZSH_THEME_GIT_PROMPT_DIRTY="${fg_bold[red]} ⦿${reset_color}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${fg_bold[green]} ?${reset_color}"
ZSH_THEME_GIT_PROMPT_CLEAN="${fg_bold[green]} ⦾${reset_color}"
ZSH_THEME_GIT_PROMPT_STASHED=" ≗"

italic=$'\e[3m'

prompt_char() {
    printf '%s ' "→"
}

conda_env_info() {
    [ $CONDA_PREFIX ] || return 1;
    local conda_env_name="$(basename $CONDA_PREFIX)"
    [[ $conda_env_name != "base" ]] && printf  '%s' "${fg[yellow]}⧳ ${conda_env_name}${reset_color}"
}

virtual_env_info() {
    [ $VIRTUAL_ENV ] && printf  '%s' "${fg[yellow]}⧲ $(basename $VIRTUAL_ENV)${reset_color}"
}

meta_info() {
    if [[ -n "$(conda_env_info)$(virtual_env_info)$(git_prompt_info)" ]]; then
        if [[ -n $(conda_env_info) ]]; then
            printf '%s ' "$(conda_env_info)"
        fi

        if [[ -n $(virtual_env_info) ]]; then
            printf '%s ' "$(virtual_env_info)"
        fi

        printf '%s' "$(git_prompt_info)$(git_prompt_status)"

    fi
}

location_info() {
    # user
    printf '%s' "${fg[cyan]}%n${reset_color}"
    # host
    printf ' %s %s' "${italic}at${reset_color}" "${fg[magenta]}%m${reset_color}"
    # directory
    printf ' %s %s' "${italic}in${reset_color}" "%~"
}

prompt_command() {
    if [[ -n $(meta_info) ]]; then
        printf '%s\n%s\n%s' "$(meta_info)" "$(location_info)" "$(prompt_char)"
    else;
        printf '%s\n%s' "$(location_info)" "$(prompt_char)"
    fi
}

PROMPT=$'$(prompt_command)'


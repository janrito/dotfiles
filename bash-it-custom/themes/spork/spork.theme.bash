#!/usr/bin/env bash
# based on bakke, changed some symbols

SCM_PROMPT_COLOR="${green}"
SCM_THEME_PROMPT_DIRTY=" ${bold_red}⦿"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}⦾"
SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

GIT_THEME_PROMPT_DIRTY=" ${bold_red}⦿"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}⦾"
GIT_THEME_PROMPT_PREFIX=""
GIT_THEME_PROMPT_SUFFIX=""

SCM_GIT_STASH_CHAR_PREFIX="≗ "
SCM_GIT_STASH_CHAR_SUFFIX=""

VIRTUALENV_THEME_PROMPT_PREFIX="⦽ "
VIRTUALENV_THEME_PROMPT_SUFFIX=' '

italic_white="\[\e[37;3m\]"



function prompt_command() {

    PS1="\n"

    if [ -n "$(virtualenv_prompt)$(scm_prompt_info)" ]; then
        # virtualenv
        PS1+="${orange}$(virtualenv_prompt)${reset_color}"

        # source control
        PS1+="${SCM_PROMPT_COLOR}$(scm_prompt_info)${normal}${reset_color}"

        PS1+="\n"
    fi

    # user
    PS1+="${cyan}\u${reset_color} ${italic_white}"
    # host
    PS1+="at${normal} ${purple}\h${reset_color}"
    # directory
    PS1+=" ${italic_white}in${normal} \w"

    # prompt
    PS1+="\n→ "
}

safe_append_prompt_command prompt_command

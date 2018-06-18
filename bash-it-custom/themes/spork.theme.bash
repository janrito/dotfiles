#!/usr/bin/env bash
# based on bakke, changed some symbols

SCM_PROMPT_COLOR="${green}"
SCM_THEME_PROMPT_DIRTY=" ${bold_red}⦿"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}⦾"
SCM_THEME_PROMPT_PREFIX=" "
SCM_THEME_PROMPT_SUFFIX=""

GIT_THEME_PROMPT_DIRTY=" ${bold_red}⦿"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}⦾"
GIT_THEME_PROMPT_PREFIX=" "
GIT_THEME_PROMPT_SUFFIX=""

SCM_GIT_STASH_CHAR_PREFIX="≗ "
SCM_GIT_STASH_CHAR_SUFFIX=""

VIRTUALENV_THEME_PROMPT_PREFIX=" ⦽ "
VIRTUALENV_THEME_PROMPT_SUFFIX=''



function prompt_command() {
    PS1="\n${cyan}\h:${reset_color}${orange}$(virtualenv_prompt)${reset_color} ${white}\w${SCM_PROMPT_COLOR}$(scm_prompt_info)${normal}${reset_color}\n→ "
}

safe_append_prompt_command prompt_command

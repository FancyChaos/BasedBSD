. /etc/fos/config/fos_shell_settings

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local EXIT="$?"

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    prompt="${Gre}->"
    [ $EXIT != 0 ] && prompt="${Red}->"

    PS1="${BBlu}\w${Gre}\$(parse_git_branch)\n${prompt} ${RCol}"
}

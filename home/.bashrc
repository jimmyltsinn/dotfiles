# If not running interactively, don't do anything
[ -z "$PS1" ] && return

### History setting
hISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoreboth
shopt -s histappend
shopt -s checkwinsize

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

function git_color {
    local git_status="$(git status 2> /dev/null)"

    if [[ ! $git_status =~ "working directory clean" ]]; then
        echo -e $COLOR_RED
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e $COLOR_YELLOW
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $COLOR_GREEN
    else
        echo -e $COLOR_OCHRE
    fi
}

function git_branch {
    local git_status="$(git status 2> /dev/null)"
    local on_branch="On branch ([^${IFS}]*)"
    local on_commit="HEAD detached at ([^${IFS}]*)"

    if [[ $git_status =~ $on_branch ]]; then
        local branch=${BASH_REMATCH[1]}
        echo " ($branch)"
    elif [[ $git_status =~ $on_commit ]]; then
        local commit=${BASH_REMATCH[1]}
        echo " ($commit)"
    fi
}

PS1="\[\e[1;2;37m\][\t] " # time
PS1+="\[\e[0;1;33m\]\u" # user
PS1+="\[\e[1;2;33m\]@" # separator between user and host
PS1+="\[\e[0;1;31m\]\h " # host
PS1+="\[\e[1;35m\]\W" # workding dir
PS1+="\[\$(git_color)\]\$(git_branch)"
PS1+="\[\e[1;36m\] $" # prompt
PS1+="${COLOR_RESET} "

export PS1
export PS2="\[\e[1;36m\]| => ${COLOR_RESET}"

export CLICOLOR=1
export LS_COLORS='di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export LSCOLORS='Gxfxcxdxbxegedabagacad'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

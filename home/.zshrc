source ${HOME}/.profile

#### Zsh / Oh-my-zsh setting
export ZSH=$HOME/.oh-my-zsh

## Ref: https://qiita.com/edvakf@github/items/b8400f7dfe9210aadddd
function __readlink_f {
    TARGET_FILE=$1

    while [ "$TARGET_FILE" != "" ]; do
        cd `dirname $TARGET_FILE`
        FILENAME=`basename $TARGET_FILE`
        TARGET_FILE=`readlink $FILENAME`
    done

    echo `pwd -P`/$FILENAME
}

settingpath="$(dirname "$(__readlink_f "${(%):-%N}")")/.."

ZSH_CUSTOM="${settingpath}/omz-custom"
ZSH_THEME="agnoster"

# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13

DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git brew docker npm pip web-search encode64 zsh-syntax-highlighting)
plugins+=(alias-tips)
plugins+=(nvm)

source $ZSH/oh-my-zsh.sh

## zsh auto complete

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#-- Added by the Heroku Toolbelt
fpath=(/usr/local/share/zsh-completions ~/.zsh/completion $fpath)

#-- Auto complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

source ${HOME}/.zsh/completion/aws_zsh_completer.sh

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
# Note: this will return error if package is not installed. Install it with $ yarn global add yarn-completions
[[ -f /Users/jimmy/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/jimmy/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh

autoload -Uz compinit && compinit -i

source ${HOME}/.profile

#### Set keyboard input setting
set input-meta on
set output-meta on
set convert-meta off

#### Zsh / Oh-my-zsh setting
export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=${HOME}/Dropbox/sync-setting/omz-custom
ZSH_THEME="agnoster"

# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13

DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git brew docker npm pip web-search encode64 zsh-syntax-highlighting)
plugins+=(alias-tips)

source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#-- Added by the Heroku Toolbelt
fpath=(/usr/local/share/zsh-completions ~/.zsh/completion $fpath)

#-- Auto complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

source ${HOME}/.zsh/completion/aws_zsh_completer.sh
autoload -Uz compinit && compinit -i

# Note: this will return error if package is not installed. Install it with $ yarn global add yarn-completions
[[ -f /Users/jimmy/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/jimmy/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh

#-- iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


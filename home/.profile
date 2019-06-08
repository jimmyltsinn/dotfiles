#### Set keyboard input setting
set input-meta on
set output-meta on
set convert-meta off

#### User configuration
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#-- TexLive path setting
export INFOPATH=${INFOPATH}:/usr/local/texlive/2014/texmf-dist/doc/info
export MANPATH=${INFOPATH}:/usr/local/texlive/2014/texmf-dist/doc/man
export PATH=${PATH}:/usr/local/texlive/2014/bin/x86_64-linux

#-- Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#-- Automatic parallel make
if [[ `uname` == "Linux" ]]; then
    export NUMCPUS=`grep -c '^processor' /proc/cpuinfo`
elif [[ `uname` == "Darwin" ]]; then
    export NUMCPUS=`sysctl -n hw.ncpu`
else
    export NUMCPUS="1"
fi
alias make='nice make -j$NUMCPUS --load-average=$NUMCPUS'

#-- Compile flags
export CPPFLAGS=-fdiagnostics-color=always
export CFLAGS=-fdiagnostics-color=always

#-- Android setting
ANDROID_SDK_PATH=${HOME}/Library/Android/sdk
PATH=${PATH}:${ANDROID_SDK_PATH}/platform-tools

export PATH=/usr/local/bin:/usr/local/sbin:${PATH}

export LS_COLORS='di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export LSCOLORS='Gxfxcxdxbxegedabagacad'

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v yarn > /dev/null 2>&1; then
    export PATH="$PATH:`yarn global bin`";
fi

#-- iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'

export GREP_COLOR='1;37;41'


# export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

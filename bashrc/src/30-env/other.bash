# env
# ---

# NOTE: 바로가기로 실행되는 환경은 login shell이므로 /etc/profile에 설정을 둬야함.
#       예로, java관련 환경변수가 /etc/profile에도 있음


# mybin
PATH="$PATH:$HOME/bin"


# depot_tool(v8, chromium 등.)
PATH="$PATH:$KANG_SRC_ROOT/Project_Ref/depot_tools"

# scala
PATH="$PATH:/opt/scala-2.12.0/bin"

# elastic beanstack cli
PATH="$PATH:$HOME/.local/bin"

# nvm
# slow startup: https://github.com/creationix/nvm/issues/539#issuecomment-245791291
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm

alias node='unalias node ; unalias npm ; nvm use default ; node $@'
alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'

# tmuxinator
export EDITOR='vim'

# rvm
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# dasht
export PATH=$PATH:~/.dasht/bin
export MANPATH=~/.dasht/man:$MANPATH
export DASHT_DOCSETS_DIR=~/.local/share/Zeal/Zeal/docsets/ # TODO

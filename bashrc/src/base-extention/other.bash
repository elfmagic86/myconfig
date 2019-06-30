# env
# ---

# NOTE: 바로가기로 실행되는 환경은 login shell이므로 /etc/profile에 설정을 둬야함.
#       예로, java관련 환경변수가 /etc/profile에도 있음


# mybin
PATH="$PATH:$HOME/bin"


# depot_tool(v8, chromium 등.)
PATH="$PATH:$GCE_MY_HOME/Project_Ref/depot_tools"

# scala
PATH="$PATH:/opt/scala-2.12.0/bin"

# elastic beanstack cli
PATH="$PATH:$HOME/.local/bin"

# tmuxinator
export EDITOR='vim'

# dasht
export PATH=$PATH:~/.dasht/bin
export MANPATH=~/.dasht/man:$MANPATH
export DASHT_DOCSETS_DIR=~/.local/share/Zeal/Zeal/docsets/ # TODO

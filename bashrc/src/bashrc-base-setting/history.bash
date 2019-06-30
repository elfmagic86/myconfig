
# history
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# https://askubuntu.com/questions/945335/histcontrol-ignoreboth-doesnt-work
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# https://stackoverflow.com/questions/9457233/unlimited-bash-history/19533853
HISTSIZE=-1
HISTFILESIZE=-1
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# shell options
# ---
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


# main
BASHRCD_PATH="${BASHRCD_PATH:-$HOME/.bashrc.d}"
source $BASHRCD_PATH/main.bash
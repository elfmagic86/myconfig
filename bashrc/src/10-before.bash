# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# is_wsl
# ---
export IS_WSL=false
if grep -q Microsoft /proc/version; then
    IS_WSL=true
fi

# working_dir
# ---
export KANG_SRC_ROOT=~/Desktop
if $IS_WSL; then
    KANG_SRC_ROOT=/mnt/d/kang
fi

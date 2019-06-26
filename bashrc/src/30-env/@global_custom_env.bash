
# OS
export GK_IS_WSL=false
if grep -q Microsoft /proc/version; then
    GK_IS_WSL=true
fi

export GK_IS_Y540=false
if uname -a | grep -q Y540; then
    GK_IS_Y540=true
fi

# global base
export GK_HOME="/kang"
if $GK_IS_WSL; then
    GK_HOME=/mnt/d/kang
fi

# global mine
export GK_MINE="${GK_HOME}/mine"
export GK_GITHUB_SRC="${GK_HOME}/github_src"

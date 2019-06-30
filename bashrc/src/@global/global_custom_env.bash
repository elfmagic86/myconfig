
# OS
export GCE_IS_WSL=false
if grep -q Microsoft /proc/version; then
    GCE_IS_WSL=true
fi

export GCE_IS_Y540=false
if uname -a | grep -q Y540; then
    GCE_IS_Y540=true
fi

# global custom my home
export GCE_MY_HOME="/kang"
if $GCE_IS_WSL; then
    GCE_MY_HOME=/mnt/d/kang
fi

# global mine
export GCE_MINE="${GCE_MY_HOME}/mine"
export GCE_GITHUB_SRC="${GCE_MY_HOME}/github_src"

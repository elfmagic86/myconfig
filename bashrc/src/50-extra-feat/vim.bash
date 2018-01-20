# vim
# ---

vim_open_nvim() {
    if [ -z $1 ]; then
        nvim
    else
        nvim "$@"
    fi
}

vim_clean_backup() {
    rm -rf ~/.vim/backup
    mkdir -p ~/.vim/backup/tmp
}


alias nv='vim_open_nvim'
alias v='vim'

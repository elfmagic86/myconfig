" open
" 재오픈시 이전커서기억 When editing a file, always jump to the last cursor position
augroup vimrc
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal g'\"" |
                \ endif
augroup END

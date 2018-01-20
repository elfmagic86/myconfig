" gui
" ---
"set cursorcolumn 좀거슬림
"set cursorline
" highlight current line
set cul
" 행번호를 사용한다. 약어 = nu
set number

"
" ---
" remove auto comment
augroup vimrc
    autocmd BufNewFile,BufRead * set formatoptions-=cro
augroup END


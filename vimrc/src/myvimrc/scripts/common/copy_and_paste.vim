"copy & paset using clipboard
"---

" system clipboard와 동기화(neovim)
" :h clipboard
" - os에따라 필요한 프로그램 설치해줘야함
" win: win32yank.exe
" linux: xclip


" delete
vnoremap <Leader>d "+dd

" paste
vnoremap <Leader>p "+p

nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" copy
vnoremap <Leader>y "+y
nnoremap <Leader>y "+yy

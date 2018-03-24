"copy & paset using clipboard
"---

" - wsl에서 clipboard로 win32yank.exe사용하기 TODO neovim은 되고 vim은 안됨
" win32yank.exe를 설치하고 wsl에 링크해준다.
" $> sudo ln -s $(which win32yank.exe) /usr/bin/win32yank

" delete
vnoremap <Leader>d "+dd

" paste
vnoremap <Leader>p "+p

nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" copy
vnoremap <Leader>y "+y
nnoremap <Leader>y "+yy

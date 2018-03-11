
" 창이동 관련
" ===
"

" 버퍼,jumps 이동
" ---
" <C-i/o>의 :jumps 이동과 유사하게
nnoremap <A-o> :bprevious<CR>
nnoremap <A-i> :bnext<CR>

if exists(':tnoremap')
    tnoremap <A-o> <C-\><C-n>:bprevious<CR>
    tnoremap <A-i> <C-\><C-n>:bnext<CR>

    tnoremap <C-o> <C-\><C-n><C-o>
    " tnoremap <C-i> <C-\><C-n><C-i> "todo: ?, 매핑적용시 terminal 에서 tab키가 <C-\><C-n> 역할이된다
endif

" window 이동
" ---
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

if exists(':tnoremap')
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
endif


" 편집화면 이동 관련
" ===

" 커서이동
" ---
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" cmdline
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>


" basic_mapping
" ===

" ?
" ===
nnoremap <A-a> ggVG


" 창이동 관련
" ===
"

" 버퍼,jumps 이동
" ---
" <C-i/o>의 :jumps 이동과 유사하게
nnoremap <A-i> :bprevious<CR>
nnoremap <A-o> :bnext<CR>


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

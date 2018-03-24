" ctrlsf
" --------

" 명시적으로 backend를 ag선택
let g:ctrlsf_ackprg = '/usr/local/bin/ag'
" ag 호출시 기본옵션을 지정해줌
let g:ctrlsf_extra_backend_args = {
            \ 'ag': '--hidden -U'
            \ }

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

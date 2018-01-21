" fzf
" ===

" opt
" ---

let g:fzf_command_prefix = 'Fzf'

" This is the default extra key bindings
let g:fzf_action = {
            \ 'enter' : 'edit',
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Enable per-command history. CTRL-N and CTRL-P
let g:fzf_history_dir = '~/.local/share/fzf-history'

" down외(up,left,right)는 tmux, nvim에서만 바르게 동작함
let g:fzf_layout = { 'down': '60%' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" mapping
" ---
nnoremap <C-p>p :call <SID>fzf_open_with_fname()<cr>
nnoremap <C-p>b :call <SID>fzf_open_with_buffers()<cr>

nnoremap <C-p>o :FzfLines<cr>
nnoremap <C-p>c :FzfCommands<cr>
" history는 FzfHistory:, FzfHistory/로 기능이 조금씩다름
nnoremap <C-p>h :FzfHistory<cr>

" nnoremap <C-f>c :FzfContent<space><C-r>=expand('<cWORD>')<cr>
nnoremap <C-f>c :FzfContent<space>
" TODO visual
vnoremap <C-f>c :<C-u>FzfContent<space><C-r>=expand('<cword>')<cr>
command! -bang -nargs=* FzfContent call s:fzf_open_with_word(<f-args>)


" open_file_hook
" ---
func! s:open_file_hook(Fzf_action)

    " nerdtree일경우 이전창으로 이동해서작업함
    if &ft == 'nerdtree' | wincmd p | endif

    " 현재파일이 수정중일 경우 enter시 split 오픈을 함
    if &modified
        let g:fzf_action['enter'] = 'split'
    else
        let g:fzf_action['enter'] = 'edit'
    endif

    " do
    call a:Fzf_action()
    " NOTE: before after로 처리할 경우 ag는 시점이 일치하지않아서 원하는동작이안됨
    " call s:after_open_file()
    " call s:before_open_file()
    " call a:Fzf_action()
endfunc


" fzf help func
" ---
func! s:fzf_open_with_fname()
    let fzf_preview_opts = fzf#vim#with_preview('right:50%', '?')

    let Fzf_action = {-> fzf#vim#files('', fzf_preview_opts) }
    call s:open_file_hook(Fzf_action)
endfunc
func! s:fzf_open_with_buffers()
    let fzf_preview_opts = fzf#vim#with_preview('right:50%', '?')

    let Fzf_action = {-> fzf#vim#buffers('', fzf_preview_opts) }
    call s:open_file_hook(Fzf_action)
endfunc

func! s:fzf_open_with_word(...)
    let query = join(a:000, ' ')
    if empty(query)
        echo 'required query arg'
        return 0
    endif

    let fzf_preview_opts = fzf#vim#with_preview('right:50%', '?')
    let Fzf_action = {->
                \ fzf#vim#ag(query, fzf_preview_opts)
                \ }
    call s:open_file_hook(Fzf_action)
endfunc

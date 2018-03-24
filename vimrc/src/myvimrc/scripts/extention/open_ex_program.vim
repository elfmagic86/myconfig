" open ex_program
" ---
" NOTE: bashrc에서 export한 명령에 의존함

nnoremap <Leader>ot :call <SID>open_terminal()<CR>
nnoremap <Leader>of :call <SID>open_filemanager()<CR>
nnoremap <Leader>ou :call <SID>open_browser()<CR>
func! s:open_terminal()
    let dir = expand('%:p:h')

    if isdirectory(dir)
        call system('open_terminal ' . shellescape(dir))
    endif
endfunc

func! s:open_filemanager()
    let dir = expand('%:p:h')

    if isdirectory(dir)
        call system('open_filemanager ' . shellescape(dir))
    endif
endfunc
func! s:open_browser()
    let url = s:url_on_cursor_line()
    if url != ""
        call system('open_browser ' . shellescape(url))
    endif
endfunc

" http://vim.wikia.com/wiki/Open_a_web-browser_with_the_URL_in_the_current_line
function! s:url_on_cursor_line()
    let line0 = getline (".")
    let line = matchstr (line0, "http[^ ]*")
    :if line==""
    let line = matchstr (line0, "ftp[^ ]*")
    :endif
    return line
endfunction

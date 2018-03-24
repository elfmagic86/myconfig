" :hi와같은 메시지를 편집가능한 새탭으로 보고싶을경우 사용. 
" http://vim.wikia.com/wiki/Capture_ex_command_output
" ex) :TabMessage hi
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction

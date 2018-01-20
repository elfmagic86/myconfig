" MultiCursor
" ---

" let g:multi_cursor_exit_from_insert_mode = 0
" let g:multi_cursor_exit_from_visual_mode = 0
"
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

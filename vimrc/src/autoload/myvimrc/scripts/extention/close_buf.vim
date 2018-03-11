

" 유용한것 찾을때까지 예전것 사용..



" 창닫기
" ---
" 에러에는 관심없기에 silent

nnoremap <silent> <A-q>a :call <SID>close_all_with_save()<cr>
nnoremap <silent> <A-q>o :call <SID>close_all_other_buf()<cr>
nnoremap <silent> <A-q>q :call <SID>close_buf_not_last()<cr>
if exists(':tnoremap')
    tnoremap <silent> <A-q>a <C-\><C-n>:call <SID>close_all_with_save()<cr>
    tnoremap <silent> <A-q>o <C-\><C-n>:call <SID>close_all_other_buf()<cr>
    tnoremap <silent> <A-q>q <C-\><C-n>:call <SID>close_buf_not_last()<cr>
endif


func! s:close_all_with_save()
    if input("save all and close vim? y/other: ") == "y"
        echo "close.."
        call s:close_all_other_buf()
        wqa
    else
        echo "cancle"
    endif
endfunc
" BUG: cwd가 변경되는 경우가있음
func! s:close_all_other_buf()
    NERDTreeClose

    let fname = expand('%')
    bufdo call s:close_buf_not_modif()

    execute ':edit ' . fname
    " TODO noname이 생기는 것을 없에는 나은방법은?
    bnext
    if len(expand('%')) == 0 | bw | endif

endfunc

func! s:close_buf_not_last()
    " https://superuser.com/a/1221514
    let buf_total = len(getbufinfo({'buflisted':1}))
    if buf_total == 1
        wincmd o
    else
        call s:close_buf_not_modif()
    endif
endfunc

" bd, bw는 버퍼 목록을 삭제함, bw는 jumplists에서도 제거함
" 터미널은 강제제거
func! s:close_buf_not_modif()
    if &buftype == 'terminal' | call g:MYTerm.close_term() | return | endif
    if &ft == 'nerdtree' | NERDTreeClose | return | endif
    if &modified
        " 일반 vim은 neovim과 다르게 modified로 되어있음을 주의
        return
    endif

    if len(&ft) > 0
        bd "윈도우와 버퍼닫기
    else
        bw "윈도우만 닫기
    endif
endfunc

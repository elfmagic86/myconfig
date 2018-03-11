

" 유용한것 찾을때까지 예전것 사용..


" # vim에서 제공하는 터미널사용시 장점?
    " - 긴로그 확인하기 쉽다.
    " - term -> vim으로 복/붙이 쉽다.

" autocmd
" ===
" auto insertmode
augroup vimrc
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufWinLeave,WinLeave term://* stopinsert
augroup END

" binding
" ===
if exists(':tnoremap')
    " transfer to normal mode
    tnoremap <A-z> <C-\><C-n>

    tnoremap <A-t> <C-\><C-n>:call g:MYTerm.toggle_terminal()<CR>
endif

nnoremap <A-t> :call g:MYTerm.toggle_terminal()<CR>
inoremap <A-t> <esc>:call g:MYTerm.toggle_terminal()<CR>

" define
" ===
let g:MYTerm = {}
let g:term_buf_nums = {}

func! g:MYTerm.toggle_terminal()
    " 터미널일경우 window닫음
    if &buftype == 'terminal'
        close
        return 1
    endif

    "
    let term_path = getcwd() " 현재 working dir 기준
    if len(term_path) == 0 | let term_path = '.' | endif " TODO 기본값 좀 쉽게줄수 없을까

    let buf_num = get(g:term_buf_nums, term_path)
    let win_num = bufwinnr(buf_num)

    let buf_exists = bufexists(str2nr(buf_num)) && buf_num > 0
    let win_exists = win_num > 0

    " TODO buf와 window의 중복, 위치를 더 고려해봐야함
    if buf_exists
        if win_exists
            " 존재하는 window로 포커스 이동
            exe win_num . "wincmd w"
        else
            " split window 생성하고 존재하는 버퍼를 가져옴
            " exe 'vertical sb ' . buf_num
            exe 'sb ' . buf_num
        endif
    else
        call g:MYTerm.new_term(term_path)
    endif
endfunc

func! g:MYTerm.close_term()
    if &buftype == 'terminal'
        bd!
        let g:term_buf_nums[getcwd()] = 0
    endif
endfunc

func! g:MYTerm.new_term(term_path)
    " 새 버퍼 생성 및 term_path으로 저장
    " vnew
    new

    " lcd로 현재 윈도우의 cwd만 변경해줌
	execute 'lcd ' . a:term_path

    if has('nvim')
        terminal
    else
        terminal ++curwin ++hidden
    endif

    " 버퍼위치 저장
    let g:term_buf_nums[a:term_path] = bufnr('%')
endfunc

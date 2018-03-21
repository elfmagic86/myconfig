
" 구질구질

"
" bindings
"
command! -nargs=0 CwdMove call <SID>move_cwd()
command! -nargs=0 CwdMoveWithbookmark call <SID>move_cwd_with_bookmark()
nnoremap <A-m>d :call <SID>move_cwd()<CR>
nnoremap <A-m>b :call <SID>move_cwd_with_bookmark()<CR>


" ==============================================================================
" feat
" ==============================================================================

" 1. move current working directory
func! s:move_cwd()
	let opts = {
				\ 'down': '60%',
				\ 'options': ''
				\ }

	let cmd = 'find ' . getcwd() . ' -maxdepth 3 -type d'
	let cmd .= ' | '
	let cmd .= 'awk ''!/\/.git\/*|\/node_modules\/*/'' '
	let cmd .= ' | '
	let cmd .= 'echo "..\n$(cat -)"'

	call s:move_by_fzf(cmd)
endfunc

" 2. move current working directory
func! s:move_cwd_with_bookmark()
	let opts = {
				\ 'down': '60%',
				\ 'options': ''
				\ }

	" TODO 하드코딩한 bookmark 기능. vim과 bash에서 공통적으로 사용할수있게만들기
	" config파일로 입력할수있게만들기.
	let b1 = '$(find $KANG_SRC_ROOT/Project_Mine -maxdepth 1 -type d)'
	let b2 = '\n$(find $KANG_SRC_ROOT/Project_Biz -maxdepth 1 -type d)'
	let b3 = '\n$(find $KANG_SRC_ROOT -maxdepth 1 -type d)'

	let cmd = 'echo "'.b1.b2.b3.'"'
	let cmd .= ' | '
	let cmd .= 'awk ''!/\/.git\/*|\/node_modules\/*/'' '
	let cmd .= ' | '
	let cmd .= 'echo "..\n$(cat -)"'

	call s:move_by_fzf(cmd)
endfunc


" TODO 3. bookmark와 비슷하게 내가 cwd이동한곳 이력남겨서(중복x) fzf로이동할수있게만들기

" ==============================================================================
" util
" ==============================================================================

func! s:move_by_fzf(cmd)
	call fzf#run({
				\ 'down': '60%',
				\ 'options': '',
				\ 'source': a:cmd,
				\ 'sink': function('s:move_cwd_loop')
				\ })
endfunc

func! s:move_cwd_loop(path)
	call s:change_cwd(a:path)

	" NOTE: 재귀의 끝은 esc로 암시적임
	call s:move_cwd()

	" TODO 재호출시 fzf term이 normal모드가된다. 똑같이 insert모드로 가고싶다.
	" - 비동기 처리하면될까했지만 안됨.
    let s:callbacks = {
    \ 'on_exit': {-> s:move_cwd_with_insert() }
    \ }
    let job1 = jobstart(['bash','-c', 'echo none;'], extend({'shell': 'shell 1'}, s:callbacks))
endfunc

func! s:move_cwd_with_insert()
	echom '-----------------------------------'
	" call s:move_cwd()
	execute 'startinsert'
	echom b:term_title
	echom '-----------------------------------'
	execute 'normal! iasdfasdfadf'
endfunc

func! s:change_cwd(path)
	" vim cwd 변경
	execute 'cd ' . a:path

	" nerdtree cwd 변경
	execute 'NERDTree | NERDTreeCWD'
endfunc

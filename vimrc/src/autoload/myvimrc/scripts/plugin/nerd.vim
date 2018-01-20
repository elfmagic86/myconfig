" nerdtree
" ===

" 기본 옵션
" ---
let g:netrw_liststyle    = 3
let NERDTreeShowHidden   = 1

let g:NERDTreeMapOpenInTab = '<c-t>'
let g:NERDTreeMapOpenSplit = '<c-x>'
let g:NERDTreeMapOpenVSplit = '<c-v>'
let g:NERDTreeMapRefresh = '<f5>'

" 확장 기능
" ---

nnoremap <C-\> :call <SID>OpenOrCloseNTAndSyncAllTabs()<CR>
nnoremap <A-\> :call <SID>NTFocusToggle()<CR>
inoremap <C-\> <esc>:call <SID>OpenOrCloseNTAndSyncAllTabs()<CR>
inoremap <A-\> <esc>:call <SID>NTFocusToggle()<CR>
if exists(':tnoremap')
	tnoremap <C-\> <C-\><C-n>:call <SID>OpenOrCloseNTAndSyncAllTabs()<CR>
	tnoremap <A-\> <C-\><C-n>:call <SID>NTFocusToggle()<CR>
endif
augroup vimrc
	autocmd TabNew * call s:OpenNTIfPrevTabHasNT()
	autocmd VimEnter * call s:NTOverrideFuncs()
augroup END


" 1. 새 탭생성시, 이전탭에 nerdtree가 존재하면 새탭에도 만듬
func! s:OpenNTIfPrevTabHasNT()
	silent tabp
	if s:IsNTOpenedInCurrentTab()
		silent tabn
		NERDTreeFocus
		wincmd p
	endif
endfunc

" 2. NT를 open/close할때, 전체 탭을 sync
func! s:OpenOrCloseNTAndSyncAllTabs()
	let l:current_tab = tabpagenr()

	if s:IsNTOpenedInCurrentTab()
		silent tabdo NERDTreeClose
		exe 'tabn ' . l:current_tab
	else
		call s:ForceOpenNTAboutAllTabs()
	endif
endfunc

func! s:ForceOpenNTAboutAllTabs()
	let l:current_tab = tabpagenr()
	silent tabdo
				\ if !s:IsNTOpenedInCurrentTab() |
				\   NERDTreeFocus |
				\   wincmd p |
				\ endif
	exe 'tabn ' . l:current_tab
	NERDTreeFocus
	" TODO 버퍼를 막이동하다보면 nerdtree의 width가 이상해져서 임시로 아래처럼함
	:vertical resize 30
endfunc

" 현재탭에 NT가 open되어있는지.
" https://stackoverflow.com/questions/41541648/how-to-check-if-nerdtree-is-open-in-vimscript
function! s:IsNTOpenedInCurrentTab()
	return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

" 3. NT에 대해 focus toggle을 함.
" 가능하면 NERDTreeFind, open에대해 다른 탭과sync맞추는 작업도함
func! s:NTFocusToggle()
	if &ft == 'nerdtree'
		wincmd p
	else
		" Note: NERDTreeFind는 현재파일에 포커스가 있을때 사용해야함
		" if not [No Name] and help
		if bufname('%') != '' && &ft != 'help'
			NERDTreeFind
			" TODO 버퍼를 막이동하다보면 nerdtree의 width가 이상해져서 임시로 아래처럼함
			:vertical resize 30
		endif

		call s:ForceOpenNTAboutAllTabs()
	endif
endfunc

" 4. monkeypatch: rm으로 영구삭제하는 기본기능 막기
func! s:NTOverrideFuncs()
	let g:NERDTreeRemoveDirCmd = 'trash '
	let g:NERDTreeRemoveFileCmd = 'trash '

	" nerdtree/lib/path.delete function. 와 내용은 큰차이없음
	" file 삭제로 builtin delete() 사용부분만 변경함
	function! g:NERDTreePath.delete()
		if self.isDirectory
			let cmd = g:NERDTreeRemoveDirCmd . self.str({'escape': 1})
			let success = system(cmd)

			if v:shell_error != 0
				throw "NERDTree.PathDeletionError: Could not delete directory: '" . self.str() . "'"
			endif
		else
			let cmd = g:NERDTreeRemoveFileCmd . self.str({'escape': 1})
			let success = system(cmd)

			if v:shell_error != 0
				throw "NERDTree.PathDeletionError: Could not delete file: '" . self.str() . "'"
			endif
		endif

		"delete all bookmarks for this path
		for i in self.bookmarkNames()
			let bookmark = g:NERDTreeBookmark.BookmarkFor(i)
			call bookmark.delete()
		endfor
	endfunction
endfunc


" init
func! s:init_vimrc_process()
	call myvimrc#basic#init()
	call myvimrc#plugin#init()

	call myvimrc#basic#setup()
	call myvimrc#plugin#setup()
endfunc

" refresh
command! -nargs=0 RefreshVimrc call <SID>init_vimrc_process()


" do init
call s:init_vimrc_process()


" init
func! s:init_vimrc_process()
	call myvimrc#basic#init()
	call myvimrc#plugin#init()

	call myvimrc#basic#setup()
	call myvimrc#plugin#setup()
endfunc

func! s:reload_plugin()
	call myvimrc#plugin#reload()
endfunc

" TODO refresh ( :so % )

" reload plugin
command! -nargs=0 ReloadPlugin call <SID>reload_plugin()


" do init
call s:init_vimrc_process()

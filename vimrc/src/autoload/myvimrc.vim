
func! myvimrc#init_vimrc()
	call s:init_vimrc_process()
endfunc

func! s:init_vimrc_process()
	call myvimrc#basic#init()
	call myvimrc#plugin#init()

	call myvimrc#basic#setup()
	call myvimrc#plugin#setup()
endfunc


" GlobalMapping
command! -nargs=0 PluginUpdate call myvimrc#plugin#install_and_update()

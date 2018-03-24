
func! s:init_vimrc_process()
	call myvimrc#basic#init()
	call myvimrc#plugin#init()

	call myvimrc#basic#setup()
	call myvimrc#plugin#setup()
endfunc



call s:init_vimrc_process()

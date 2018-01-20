
let s:module = {}

func! myvimrc#module#scriptLoader#module()
	return s:module
endfunc

func! s:module.loadAll(globPath)
	for f in split(glob(a:globPath), '\n')
		exe 'source' f
	endfor
endfunc

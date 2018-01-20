let s:scriptLoader = myvimrc#module#scriptLoader#module()

func! myvimrc#plugin#init()
	call s:init_plugin_process()
endfunc

func! myvimrc#plugin#setup()
	let target = '~/.vim/autoload/myvimrc/scripts/plugin/*.vim'

	call s:scriptLoader.loadAll(l:target)
endfunc

func! myvimrc#plugin#install_and_update()

	call map(dein#check_clean(), "delete(v:val, 'rf')")
	call dein#recache_runtimepath()

	" call dein#install()
	call dein#update()

	call dein#remote_plugins()
endfunc

func! s:init_plugin_process()
	" Required:
	set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

	" Required:
	if dein#load_state('~/.vim/dein')
		call dein#begin('~/.vim/dein')
		" Let dein manage dein
		" Required:
		call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')


		call s:load_plugins()


		" Required:
		call dein#end()
		call dein#save_state()
	endif

	" Required:
	filetype plugin indent on
	syntax enable


	if dein#check_install()
		call myvimrc#plugin#install_and_update()
	endif

endfunc

func! s:load_plugins()
	" ---
	" manage/search file, content, etc...
	" ---

	call dein#add('scrooloose/nerdtree')

	call dein#add('Shougo/denite.nvim')

	" todo: https://gabri.me/blog/multiple-files-search-and-replace-in-vim/
	call dein#add('dyng/ctrlsf.vim')

	" ---
	" editing
	" ---
	call dein#add('tpope/vim-surround')

	call dein#add('terryma/vim-multiple-cursors')

	call dein#add('scrooloose/nerdcommenter')

	" snippet
	" Track the engine.
	call dein#add('SirVer/ultisnips')
	" Snippets are separated from the engine. Add this if you want them:
	call dein#add('honza/vim-snippets')

	" ---
	" autocomplete
	" ---

	if has('nvim')
		call dein#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
	else
		call dein#add('Shougo/deoplete.nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif


	" Java autocomplete
	call dein#add('artur-shaik/vim-javacomplete2')

	" ---
	" lint
	" ---
	" todo
	" call dein#add('w0rp/ale')


	" ---
	" lang
	" ---

	" vue
	call dein#add('posva/vim-vue')

	" js, mjs ...
	call dein#add('pangloss/vim-javascript')

	" ---
	" etc
	" ---

	" term
	call dein#add('Shougo/deol.nvim')

	" color
	call dein#add('junegunn/seoul256.vim')

	" status
	call dein#add('itchyny/lightline.vim')

	" editorconfig
	call dein#add('editorconfig/editorconfig-vim')
endfunc

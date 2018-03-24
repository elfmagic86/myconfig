let s:scriptLoader = myvimrc#module#scriptLoader#module()

func! myvimrc#plugin#init()
	call s:init_plugin_process()
endfunc

func! myvimrc#plugin#setup()
	let target = '~/.vim/autoload/myvimrc/scripts/plugin/*.vim'

	call s:scriptLoader.loadAll(l:target)
endfunc





func! s:init_plugin_process()
	call plug#begin('~/.vim/plugged')


	call s:load_plugins()


	call plug#end()
endfunc


func! s:load_plugins()
	" ---
	" manage/search file, content, etc...
	" ---

	Plug 'scrooloose/nerdtree'

	Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
	Plug 'junegunn/fzf.vim'

	" todo: https://gabri.me/blog/multiple-files-search-and-replace-in-vim/
	Plug 'dyng/ctrlsf.vim'

	" ---
	" editing
	" ---
	Plug 'tpope/vim-surround'

	Plug 'terryma/vim-multiple-cursors'

	Plug 'scrooloose/nerdcommenter'

	" snippet
	" Track the engine.
	Plug 'SirVer/ultisnips'
	" Snippets are separated from the engine. Add this if you want them:
	Plug 'honza/vim-snippets'

	" ---
	" autocomplete
	" ---

	if has('nvim')
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif


	" Java autocomplete
	" Plug 'artur-shaik/vim-javacomplete2'
	Plug 'dansomething/vim-eclim'

	" ---
	" lint
	" ---
	" todo
	" Plug 'w0rp/ale'


	" ---
	" lang
	" ---

	" vue
	Plug 'posva/vim-vue'

	" js, mjs ...
	Plug 'pangloss/vim-javascript'

	" ---
	" etc
	" ---

	" term
	" extention/

	" color
	Plug 'junegunn/seoul256.vim'

	" statusline, tabline
	Plug 'ap/vim-buftabline'
	Plug 'itchyny/lightline.vim'

	" editorconfig
	Plug 'editorconfig/editorconfig-vim'

endfunc

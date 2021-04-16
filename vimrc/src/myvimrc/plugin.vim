let s:scriptLoader = myvimrc#module#scriptLoader#module()

func! myvimrc#plugin#init()
	call s:init_plugin_process()
endfunc

func! myvimrc#plugin#setup()
	let target = '~/.vim/autoload/myvimrc/scripts/plugin/*.vim'

	call s:scriptLoader.loadAll(l:target)
endfunc

func! myvimrc#plugin#reload()
	call s:load_plugins()
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
	" Plug 'tpope/vim-surround'

	Plug 'terryma/vim-multiple-cursors'

	Plug 'scrooloose/nerdcommenter'

	" snippet
	" Track the engine.
	" Plug 'SirVer/ultisnips'
	" Snippets are separated from the engine. Add this if you want them:
	" Plug 'honza/vim-snippets'

	" ---
	" autocomplete
	" ---
	function! BuildYCM(info)
	  " info is a dictionary with 3 fields
	  " - name:   name of the plugin
	  " - status: 'installed', 'updated', or 'unchanged'
	  " - force:  set on PlugInstall! or PlugUpdate!
	  if a:info.status == 'installed' || a:info.force
		!./install.py
	  endif
	endfunction

	Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

	" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

	" Java autocomplete
	" Plug 'artur-shaik/vim-javacomplete2'

	" https://github.com/junegunn/vim-plug/issues/32
	" ~/.vim/plugged/eclim에 설치해야함
	" Plug g:plug_home.'/eclim'


	" ---
	" lint
	" ---
	" todo
	" Plug 'w0rp/ale'


	" ---
	" lang
	" ---

	" js
	" Plug 'pangloss/vim-javascript'
	" vue
	" Plug 'posva/vim-vue'

	" golang
	" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	" ---
	" ctags? Ggrep?
	" ---
	" TODO ...

	" ---
	" etc
	" ---

	" term
	" extention/

	" color
	" Plug 'junegunn/seoul256.vim'

	" statusline, tabline
	Plug 'ap/vim-buftabline'
	Plug 'itchyny/lightline.vim'

	" editorconfig
	Plug 'editorconfig/editorconfig-vim'

	" startify
	" Plug 'mhinz/vim-startify'

	" markdown
	" Plug 'godlygeek/tabular'
	" Plug 'plasticboy/vim-markdown'

	" Add maktaba and bazel to the runtimepath.
	" (The latter must be installed before it can be used.)
	" Plug 'google/vim-maktaba'
	" Plug 'bazelbuild/vim-bazel'

endfunc

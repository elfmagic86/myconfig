let s:scriptLoader = myvimrc#module#scriptLoader#module()

func! myvimrc#basic#init()
	call s:init_basic_process()
endfunc

" TODO 스크립트 위치 하드코딩
func! myvimrc#basic#setup()
	call s:scriptLoader.loadAll('~/.vim/autoload/myvimrc/scripts/common/*.vim')
	call s:scriptLoader.loadAll('~/.vim/autoload/myvimrc/scripts/extention/*.vim')
endfunc

func! s:init_basic_process()
	call s:setup_first()
	call s:setup_altkey()
	call s:setup_basic()
endfunc

func! s:setup_first()
	set nocompatible

	" 주의: 글로벌 변수에 설정해야함
	let g:mapleader = ","
	let g:maplocalleader = ";"

	" NOTE: 모든 autocmd는 vimrc로 그룹화함
	augroup vimrc
		autocmd!
	augroup END

endfunc

func! s:setup_altkey()
	" alt키 허용위한 설정
	" TODO only gnome-terminal을 원함. 아래 if는 추측
	if !has('nvim') && !has('gui_running')
		let c='a'
		while c <= 'z'
			exec "set <A-".c.">=\e".c
			exec "imap \e".c." <A-".c.">"
			let c = nr2char(1+char2nr(c))
		endw

		" TODO a-z외의 것은 어떻게 배정해야할까
		exec "set <A-".'\'.">=\e".'\'
	endif
endfunc

" TODO 역할별 이름으로 분할

func! s:setup_basic()
	set ttimeout " time out for key codes
	set ttimeoutlen=50  " wait up to 100ms after Esc for special key

	" backup // folder없으면 e303에러남.
	set backup
	set backupdir=~/.vim/backup
	set directory=~/.vim/backup/tmp


	"TODO 실제, 저장시에는 읽은 파일인코딩으로저장됨. 수동으로 이런방법사용해야되는문제. :write ++enc=utf-8 russian.txt
	" window에서저장된 txt파일은 cp949로되어있다. 인코딩문제로깨짐. https://kldp.org/node/32987
	" 한글 파일은 euc-kr로 읽어들이며 유니코드는 유니코드로 읽어들이도록 설정"
	set fencs=ucs-bom,utf-8,cp949,euc-kr.latin1 "fileencodings
	set fileencoding=utf-8 " 실제로 파일을 저장할때 사용되는 인코딩은 utf-8
	set tenc=utf-8      " 터미널 인코딩

	" history
	set history=1000    " vi 편집기록을 1,000까지 기억함
	set undolevels=1000 " 1000 undos

	" mouse
	if has('mouse')
		set mouse=a
	endif

	" highlighting
	set t_Co=256  "기본설정이 8임.

	" paste
	" !! set paste는 여러 설정을건드려서 안하는것이 낫다
	set nopaste
	set pastetoggle=<F2>
	"set paste "auto comment, autoindent 전부막는것이라 사용안함

	" nowrap
	set nowrap
	set textwidth=0 wrapmargin=0

	" TODO dos2unix
	autocmd InsertEnter,InsertLeave *.bash setlocal ff=unix
	autocmd InsertEnter,InsertLeave *.sh setlocal ff=unix
endfunc

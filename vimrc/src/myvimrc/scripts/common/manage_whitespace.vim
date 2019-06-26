" manage_whitespace(여백)
" ===


" show whitespace
" ---
set list "listchars를 enable하기위해 필요.

if $GK_IS_WSL == "true"
	set listchars=tab:>.,trail:.,eol:↲,extends:»,precedes:«,nbsp:%
else
    set listchars=tab:→\ ,trail:·,eol:¬,extends:…,precedes:…
endif


" define character(indent, tabkey)
" ---

" WARN: editorconfig

" set expandtab " spacekey
set noexpandtab " tab

set tabstop=2
set shiftwidth=2

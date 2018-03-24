" nerd-commenter
" ---

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" python은 위 설정시 space가 두칸이생김. 아래처럼 변경해야함
" 연관이슈: https://github.com/scrooloose/nerdcommenter/issues/278
let g:NERDCustomDelimiters = { 'python': { 'left': '#', 'leftAlt': '#' } }

" https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
" <C-/> mapping, link 참고
" TODO wsl에서 매핑이안됨.
map <C-_> <Plug>NERDCommenterToggle

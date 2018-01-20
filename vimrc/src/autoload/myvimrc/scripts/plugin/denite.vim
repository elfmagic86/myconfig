
" ===
" config
" ===

" Change command.
" file_rec
call denite#custom#var('file_rec', 'command',
			\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])


" grep
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
			\ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Change mappings.
call denite#custom#map(
			\ 'insert',
			\ '<C-j>',
			\ '<denite:move_to_next_line>',
			\ 'noremap'
			\)
call denite#custom#map(
			\ 'insert',
			\ '<C-k>',
			\ '<denite:move_to_previous_line>',
			\ 'noremap'
			\)

" :Denite [{options}] {sources}
nnoremap <C-p>p :Denite file_rec<cr>
nnoremap <C-p>b :Denite buffer<cr>
nnoremap <C-p>l :Denite line<cr>
nnoremap <C-p>h :Denite file_old<cr>
nnoremap <C-p>c :Denite grep<cr>

" :DeniteCursorWord [{options}] {sources}
vnoremap <C-p>p :DeniteCursorWord file_rec<cr>
vnoremap <C-p>b :DeniteCursorWord buffer<cr>
vnoremap <C-p>l :DeniteCursorWord line<cr>
vnoremap <C-p>h :DeniteCursorWord file_old<cr>
vnoremap <C-p>c :DeniteCursorWord grep<cr>

" :DeniteBufferDir [{options}] {sources}
" :DeniteProjectDir [{options}] {sources}

" ===
" usage
" ===
" Initial search term
" :Denite -input=foo file_rec

" And
" foo bar

" NOT
" foo !bar

" ===
" TODO
" ===

" tag

" jump

" command

" menu

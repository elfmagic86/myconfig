" bazel
augroup vimrc
  autocmd BufNewFile,BufRead *.bzl
	\ setlocal expandtab |
	\ setlocal tabstop=2 |
	\ setlocal shiftwidth=2
augroup END


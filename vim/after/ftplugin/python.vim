setlocal tabstop=4
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal autoindent
setlocal shiftround " round indent to multiple of 'shiftwidth'
setlocal textwidth=79 " lines longer than 79 columns will be broken
setlocal fileformat=unix
setlocal encoding=utf-8

" Enable folding
setlocal foldmethod=indent
setlocal foldlevel=99

augroup fold_space
	au!
	au BufWinEnter <buffer> setlocal foldexpr=SimplyFold(v:lnum) foldmethod=expr
	au BufWinLeave <buffeer> setlocal foldexpr< foldmethod<
augroup END

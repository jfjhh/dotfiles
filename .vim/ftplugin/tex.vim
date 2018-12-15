setlocal autoindent
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal iskeyword+=:
" let b:suppress_latex_suite = 1

nnoremap <leader>lt :w<cr>:! lualatex %<cr>

" Editing LaTeX files can be slow if these are enabled.
NoMatchParen
" setlocal nocursorline
" setlocal norelativenumber


setlocal autoindent
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal conceallevel=2

function! PandocMarkdownToHTML()
	silent !clear
	execute "! pandoc --template=/home/jfjhh/projects/misc-software/template.html --css=/home/jfjhh/projects/misc-software/simple.css -t html -o " . fnamemodify(bufname("%"), ":r") . ".html " . bufname("%")
endfunction

nnoremap <buffer> <localleader>p :call PandocMarkdownToHTML()<cr><cr>


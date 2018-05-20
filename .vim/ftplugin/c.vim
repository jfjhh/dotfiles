" Indentation rules.
setlocal autoindent
setlocal cindent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal foldmethod=syntax

" Easy struct pointer dereference.
inoremap -- ->

" Jumps out of parenthesis.
inoremap <leader><leader>			<esc>%%a

" Selectively choose to create closing curly brackets or not.
fun! SetCBMap()
	:inoremap {<cr>	{<cr>.<cr>}<esc>k$xa
endfun
nnoremap <F4>									:call SetCBMap()<cr>
fun! UnSetCBMap()
	:iunmap {<cr>
endfun
nnoremap <F5>									:call UnSetCBMap()<cr>

" Set closing curly brackets by default.
inoremap {<cr>	{<cr>.<cr>}<esc>k$xa

" Unmap semicolons if I edited vim code in the same session.
fun! UnMapSemiColon()
	:iunmap ;<cr>
	:iunmap ;<tab><cr>
	:iunmap ;<space>
endfun
nnoremap <F6>									:call UnMapSemiColon()<cr>

" Comment insertion and deletion.
setlocal commentstring=\/\/%s


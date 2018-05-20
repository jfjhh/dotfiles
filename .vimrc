set nocompatible " Set to be not compatable with Vi.

" Init stuff. {{{
filetype on
filetype indent on
filetype plugin indent on

let mapleader      = ","
let maplocalleader = ","
" }}}

" Plugin Settings. {{{

" Netrw.
let g:netrw_dirhistmax = 0
let g:netrw_banner     = 0
let g:netrw_liststyle  = 3
let g:netrw_list_hide  = netrw_gitignore#Hide()

" Ctrl-P.
let g:ctrlp_by_filename         = 1
let g:ctrlp_use_caching         = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_tabpage_position    = 'al'
let g:ctrlp_working_path_mode   = 'r'
let g:ctrlp_show_hidden         = 0
let g:ctrlp_brief_prompt        = 1
let g:ctrlp_mruf_save_on_update = 0

" Syntastic.
let g:syntastic_c_checkers    = ['make', 'gcc']
let g:syntastic_cpp_checkers  = ['make', 'g++']
let g:syntastic_asm_checkers  = ['nasm']
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq   = 0
let g:syntastic_auto_jump     = 0
let g:syntastic_mode_map      = { 'mode': 'active' }

" Vim-LaTeX
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='evince'
let g:Tex_FoldedEnvironments='verbatim,comment,eq,gather,align,figure,table,thebibliography,keywords,abstract,titlepage,frame,problem,subproblem,theorem,thm,subthm'
let g:Tex_MultipleCompileFormats='dvi,pdf'

" Vim-Markdown
let g:vim_markdown_fenced_languages = ['c', 'bash=sh', 'lisp']
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_math = 1

" Vim2HS
let g:haskell_conceal_wide = 1

" Pathogen.
call pathogen#infect()

" }}}

" Syntax highlighting customizations. {{{
set t_Co=16
syntax enable
set background=dark
let g:solarized_visibility='low'
let g:solarized_termtrans=1
let g:solarized_menu=0
colorscheme solarized
"
" Highlight text different when it is after the 80th column. This is a test line for overlength lines.
hi OverLength term=reverse cterm=reverse gui=reverse
" }}}

" Statusline. {{{
set statusline=                              " clear default statusline
set statusline+=\ %2*                        " file info coloring
set statusline+=%t                           " tail of the filename
set statusline+=\ %{Fenc()}                  " file encoding
set statusline+=%h                           " help file flag
set statusline+=%r                           " read only flag
set statusline+=%y                           " filetype
set statusline+=\ %1*                        " modified coloring
set statusline+=%m                           " modified flag
set statusline+=%{fugitive#statusline()}     " git repo information
set statusline+=\ %3*                        " color for syntax errors
set statusline+=%{SyntasticStatuslineFlag()} " syntax errors
set statusline+=%2*                          " normal color
set statusline+=%=                           " left/right separator
set statusline+=%l/%L,                       " cursor line/total lines
set statusline+=%c                           " cursor column
set statusline+=\ %P                         " percent through file
" }}}

" Misc. functions. {{{
function! <SID>StripTrailingWhitespaces()
	" Save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position.
	let @/=_s
	call cursor(l, c)
endfunction

" reindents the file if it is an ok type and strips whitespace.
fun! WriteReindent()
	if &ft == 'markdown' || &ft == 'conf'
		return
	else
		normal mzgg=G`z
		call <SID>StripTrailingWhitespaces()
	endif
endfun

" get filencoding.
function! Fenc()
	if &fenc !~ "^$\|utf-8" || &bomb
		return "[" . &fenc . (&bomb ? "-bom" : "" ) . "]"
	else
		return ""
	endif
endfunction
" }}}

" Helpful mappings. {{{
nnoremap <up> <c-w>k
nnoremap <down> <c-w>j
nnoremap <left> <c-w>h
nnoremap <right> <c-w>l
inoremap jk <esc>
inoremap JK <esc>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>re :call WriteReindent()<cr>
nnoremap <silent> <leader>l :nohlsearch<cr><leader>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-x> <c-w>x
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap Z= z=1<cr><cr>
nnoremap zO zCzO
nnoremap <space> za
vnoremap <space> za
" }}}

" Augroups {{{
if has("autocmd")

	augroup new_file_space
		autocmd!
		autocmd BufNewFile * :normal O
	augroup END

	augroup buf_read_post
		autocmd!
		autocmd BufReadPost fugitive://* set bufhidden=delete
		autocmd BufReadPost *
					\ if line("'\"") > 0 && line("$") |
					\		exe "normal! g`\"" |
					\ endif
	augroup END

	augroup source_vimrc_write
		autocmd!
		autocmd BufWritePost $MYVIMRC source $MYVIMRC
	augroup END

	augroup change_ft
		autocmd!
		autocmd BufReadPre,BufNewFile *.cf set filetype=lbnf
	augroup END

	augroup update_overlength
		autocmd!
		autocmd CursorHold,BufWritePost,BufReadPost * match OverLength /\%81v.\+/
	augroup END

	augroup views
		autocmd!
		autocmd BufWinLeave ?* mkview
		autocmd BufWinEnter ?* silent loadview
	augroup END

endif
" }}}

" Options. {{{
set backspace=indent,eol,start
set foldlevelstart=0
set number
set numberwidth=3
set ruler
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=999
set showcmd
set nowrap
set textwidth=80
set wrapmargin=0
set sidescroll=5
set sidescrolloff=10
set list
set listchars=precedes:<,extends:>,tab:>\ ,trail:@
set complete=.,w,b,u,t,i,kspell
set cursorline
set showmatch
set matchtime=1
set writeany
set writebackup
set backupdir=~/.vimswp
set directory=~/.vimswp
set tags=~/.vim/systags
set timeoutlen=500
set path+=**
set wildmenu
set wildignorecase
set wildignore=*.o,*.obj,*.git/**,*~
set viewoptions-=options
set undofile
set undodir=~/.vimundo
set autowrite
set magic
set laststatus=2
set autoread
set viminfo^=%
set hidden
" }}}

"
" Prevent various Vim features from keeping the contents of pass(1) password
" files (or any other purely temporary files) in plaintext on the system.
"
" Either append this to the end of your .vimrc, or install it as a plugin with
" a plugin manager like Tim Pope's Pathogen.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
"
" {{{
"
" Don't backup files in temp directories or shm
if exists('&backupskip')
	set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
endif
" Don't keep swap files in temp directories or shm
if has('autocmd')
	augroup swapskip
		autocmd!
		silent! autocmd BufNewFile,BufReadPre
					\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
					\ setlocal noswapfile
	augroup END
endif
" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
	augroup undoskip
		autocmd!
		silent! autocmd BufWritePre
					\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
					\ setlocal noundofile
	augroup END
endif
" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
	if has('autocmd')
		augroup viminfoskip
			autocmd!
			silent! autocmd BufNewFile,BufReadPre
						\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
						\ setlocal viminfo=
		augroup END
	endif
endif
" }}}


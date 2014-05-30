" Syntax highlighting
syntax on

" Command tab completion
set wildmode=longest,list,full
set wildmenu

" Auto-indent
filetype indent plugin on

" Indentation config
set tabstop=4		" sets tabstops to 4 chars
set expandtab		" converts tabs to whitespace
set shiftwidth=4	" <TAB> indents with 4 spaces
set softtabstop=4	" sets autoindent width

" Dark background
set background=dark

" Always show current position
set ruler

" Backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show matching brackets, blink for 2/10s
set showmatch
set mat=2

" UTF8 as standard encoding
set encoding=utf8

" UNIX as standard filetype, followed by Mac and Win
set ffs=unix,mac,dos

" Delete trailing whitespace on save for Python
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal 'z'"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Status line config
" pwd - curr_file filetype col line/total_lines
set laststatus=2
set statusline=%{getcwd()}\ -\ %f%m%r\ %y\ %c\ %l/%L

" Display a column ruler at 80
set colorcolumn=80

" Show line numbers
set number

" Use system clipboard
set clipboard=unnamed

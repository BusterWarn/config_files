" Set to 256 Colors
set t_Co=256
"to get rid of strange characters until refresh or similar (crtl+l)
set t_u7=
set t_RV=
" Get out of the horrible vi-compatible mode
set nocompatible
" Start searching before pressing enter
set incsearch
" Highlite all search matches
set hlsearch
" Don't beep or flash please
set noerrorbells
set visualbell
set t_vb=
" Let me use backspace please
set backspace=indent,start,eol
" Syntax highlight if available
syntax on
" Don't wrap lines.
" set nowrap
" Enable mouse all the time
set mouse=a
" Show line numbers
set nu
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
"language en_US.utf-8 
" I use a dark background and the my own tweaked molokai colorscheme
set background=dark
colorscheme ozrak_molokai
" display row and column in the bottom right corner
set ruler
" Expand tabs to spaces
" Use indents of 4 spaces
" Set tab to 4 spaces
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

map <F4> :set syntax=log <CR>

"CODING STUFF
" For C-like programming, have automatic indentation
autocmd FileType c,cpp,slang set cindent
" add 120 column marker (disegn rule cat nc)
autocmd BufRead,BufNewFile *.cc,*.h,*.cpp,*.hpp set colorcolumn=120
highlight ColorColumn ctermbg=darkcyan

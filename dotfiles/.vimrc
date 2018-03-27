
" Our package manager

execute pathogen#infect()

" Colorscheme & Allow all colors
colorscheme blackboard "What Meeseeks would use
set  t_Co=256

set number
filetype on
syntax on

" Keep more info in memory to speed things up
set hidden
set history=100

" Set for C++

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

filetype indent on
"set nowrap
"set tabstop=2
"set shiftwidth=2
"set expandtab
"set smartindent
"set autoindent

" Keep a 100 char checker

"set colorcolumn=100
"highlight ColorColumn ctermbg=200

" Remove whitespace on save

autocmd BufWritePre * :%s/\s\+$//e

" Highlight search terms
set hlsearch
set showmatch


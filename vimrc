set autochdir
set smartcase
set nocompatible
set expandtab
set smarttab
set autoindent
" 256 Colors
set t_Co=256
" Highlight dynamically as pattern is typed
set incsearch
set hlsearch
set ttyfast
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set clipboard=unnamed
syntax on
set history=20000
set backupdir=~/.tmp
set directory=~/.tmp
" Show the cursor position
set ruler
" Don't show the intro message when starting Vim
set shortmess=atI

" ignore
set wildignore=*.swp,*.bak,*.pyc,*.class,*.pyc,*.pyo
let g:netrw_list_hide= '.*\.pyc$,.*\.pyo$,*\.swp$'

" undo
set undodir=~/.tmp/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" detect puppet filetype
autocmd BufRead,BufNewFile *.pp set filetype=puppet
autocmd BufRead,BufNewFile *.pp setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab textwidth=80 smarttab

" vundle
set nocompatible
filetype off
set rtp+=/home/jfroche/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'tpope/vim-fugitive'
Bundle 'Puppet-Syntax-Highlighting'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'avakhov/vim-yaml'
Bundle 'Syntastic'
Bundle 'Tabular'
Bundle 'airblade/vim-gitgutter'
call vundle#end()  
filetype plugin indent on

" hit "-" (minus) anytime to open the file explorer to show files adjacent to
" the one I just edit
map - :Explore<cr>

" sudo write
cmap w!! w !sudo tee %

" statusline
set laststatus=2
set statusline=%n:%<%f\ %h%m%r\ %=%-10.(%l,%c%V%)\ %4L\ %P

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
set clipboard=unnamed
syntax on
set backupdir=~/.tmp
set directory=~/.tmp
" Show the cursor position
set ruler
" Don't show the intro message when starting Vim
set shortmess=atI
set backspace=2
" ignore
set wildignore=*.swp,*.bak,*.pyc,*.class,*.pyc,*.pyo
let g:netrw_list_hide= '.*\.pyc$,.*\.pyo$,*\.swp$,tags'

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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'tpope/vim-fugitive'
Bundle 'Puppet-Syntax-Highlighting'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'avakhov/vim-yaml'
Bundle 'Tabular'
Bundle 'airblade/vim-gitgutter'
Bundle 'itchyny/lightline.vim'
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'
Bundle 'rking/ag.vim'
Bundle 'benmills/vimux'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'majutsushi/tagbar'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'dhruvasagar/vim-table-mode'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'hrp/EnhancedCommentify'
Plugin 'honza/vim-snippets'
Plugin 'fatih/vim-go'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
Bundle 'saltstack/salt-vim'
Bundle 'roman/golden-ratio'
Plugin 'LnL7/vim-nix'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'rodjek/vim-puppet'
Plugin 'davidhalter/jedi-vim'
Plugin 'w0rp/ale'
Plugin 'reedes/vim-pencil'
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

" vim-session
let g:session_autosave_periodic=1
let g:session_autosave='yes'
let g:session_autoload='no'
" Set session folder to the same as vim-startify
let g:session_directory='~/.vim/sessions'
" Ag options
" blocked by https://github.com/ggreer/the_silver_searcher/issues/915
let g:ag_prg="ag --vimgrep -U"
let g:ag_working_path_mode="r"
" zope
autocmd BufRead,BufNewFile *.zcml :set ft=xml 
" go
autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120 expandtab smarttab
" CTRLP option
let g:ctrlp_working_path_mode = 'cr'
" solarized config
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
" ctags
set tags+=tags;$HOME
" python pdb
iab ipdb import ipdb;ipdb.set_trace()
iab pdbs import pdb;pdb.set_trace()
" spell check
"
autocmd BufRead *.{py,txt,rst,tex} setlocal spell spelllang=en_us,fr
autocmd BufRead mutt-* setlocal spell spelllang=fr,en
autocmd BufNewFile,BufRead /tmp/mutt-* set filetype=mail
au      Filetype mail setlocal formatoptions+=aw

" trac - cartman
autocmd BufNewFile *.cm.ticket setf mail

" syntastic
let g:syntastic_loc_list_height=3
let g:syntastic_python_checkers=['flake8']

" template management
function! LoadFileTemplate()
  silent! 0r ~/.vim/templates/%:e.tpl
  syn match vimTemplateMarker "<+.++>" containedin=ALL
  hi vimTemplateMarker guifg=#67a42c guibg=#112300 gui=bold
endfunction

autocmd BufNewFile * :call LoadFileTemplate()
nnoremap <c-j> /<+.\{-1,}+><cr>c/+>/e<cr>
inoremap <c-j> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>

let g:UltiSnipsExpandTrigger="<right>"

" Change the default leader
let mapleader = ","

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:winfixheight = 4

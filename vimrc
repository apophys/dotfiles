" Vimrc file
" wolfie, January 2010
" apophys, December 2014
set nocompatible

" Plugins
call plug#begin()
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'nvie/vim-flake8'
Plug 'elixir-lang/vim-elixir'
Plug 'davidhalter/jedi-vim'
call plug#end()

" Commenting out the original configuration
set shiftwidth=4
set softtabstop=4
set expandtab
set showcmd
set hlsearch
set ruler
set ignorecase
set title
syntax on
set ttyfast
set number
set laststatus=2
set autowrite

filetype plugin indent on

" Custom syntax enforcing
autocmd BufRead,BufNewFile /tmp/ldapvi-* set syntax=ldif

if has("gui_running")
	set guifont=Monospace\ 10
	set lines=36
	set columns=80
	set background=dark
        colorscheme desert
else
	set background=dark
endif

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" python flake8 for python 2
let g:flake8_cmd="/usr/bin/flake8-python2"

" update to jedi's config
"
" do not open the docstring popup
autocmd FileType python setlocal completeopt-=preview

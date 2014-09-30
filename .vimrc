" Vimrc file
" wolfie, January 2010
" apophys, March 2010
set nocompatible
" set expandtab " with soft tabs only
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

if has("gui_running")
	set guifont=Monospace\ 10
	set lines=36
	set columns=80
	colorscheme desert
	set background=dark
else
"	colorscheme evening
	set background=dark
endif

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif


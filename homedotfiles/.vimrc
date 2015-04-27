set nu
set ic
set sm
set nocompatible
syntax enable
set background=dark
"set ruler
set laststatus=2

"Vundle options
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
filetype off
"Vundle plugins
Plugin 'gmarik/Vundle.vim'
Bundle 'justinmk/vim-sneak'
Bundle 'leafo/moonscript-vim'
Bundle 'dag/vim-fish'
"Plugin 'bling/vim-airline'
"Vundle end settings
call vundle#end()
filetype plugin indent on

"Powerline options
"let g:airline_powerline_fonts = 1

"GUI options
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guifont=Inconsolata\ Medium\ 16
set guiheadroom=0

set t_Co=16

"Keybind options
"Colemak specific
noremap h k
noremap j h
noremap k j
"Window management binds
nmap <c-j> <C-W>h
nmap <c-l> <C-W>l
nmap <c-k> <C-W>j
nmap <c-h> <C-W>k
nmap <c-v> <C-W>v
nmap <c-n> <C-W>n
nmap <c-c> <C-W>c

"Color settings
hi LineNr ctermbg=black
hi LineNr ctermfg=blue
hi CursorLineNr ctermfg=cyan
hi CursorLineNr ctermbg=black
hi Comment ctermfg=magenta
hi Special ctermfg=red
hi CursorLine ctermbg=black
hi CursorColumn ctermbg=black

"Tab settings
set list!
set listchars=tab:>-,trail:·
set tabstop=2

"Indent settings
set autoindent
set copyindent

"Cursor lines enable
set cursorline
set cursorcolumn

"Relative line numbers
set relativenumber

"Disable line wrapping
set nowrap

"Disable status lines on minimized windows
set wmw=0
set wmh=0

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

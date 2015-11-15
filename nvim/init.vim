set nu
set ic
set sm
syntax enable
set background=dark
"set ruler
set laststatus=2

"Vundle options
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
filetype off
"Vundle plugins
Plugin 'gmarik/Vundle.vim'
Bundle 'justinmk/vim-sneak'
Bundle 'leafo/moonscript-vim'
Bundle 'dag/vim-fish'
Bundle 'morhetz/gruvbox'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
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
"Rebind Sneak mode to F
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S
"Bind s to cl and S to cc
map s cl
map S cc

"Color settings
"hi LineNr ctermbg=black
"hi LineNr ctermfg=blue
"hi CursorLineNr ctermfg=cyan
"hi CursorLineNr ctermbg=black
"hi Comment ctermfg=magenta
"hi Special ctermfg=red
"hi CursorLine ctermbg=black
"hi CursorColumn ctermbg=black
colorscheme gruvbox

"Tab settings
set list!
set listchars=tab:>-,trail:·
set tabstop=2
set shiftwidth=2

"Indent settings
set autoindent
set copyindent
set cindent
set noexpandtab

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

"Disable mouse support
set mouse=

" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.vim

" syntax highlighting
filetype plugin indent on
syntax on
set showmatch

" numbers on the side
set number
set relativenumber

" mouse support i.e. clicking
set mouse=a

" don't highlight every search match
set nohlsearch

" Split the window below. Split the window vertically to the right
set splitbelow splitright

" spell checking
set spelllang=en,es,cjk

" auto-indent to 4 spaces
set shiftwidth=4
" tab key inserts 4 spaces (insert mode)
set softtabstop=4
" insert spaces instead of tab characters (insert mode)
set expandtab

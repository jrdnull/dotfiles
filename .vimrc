set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'

call vundle#end()

filetype plugin indent on
syntax on

set noswapfile
set laststatus=2
set number
set ignorecase
set smartcase

colorscheme molokai
let g:molokai_original=1
let g:rehash256=1
set background=dark

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set expandtab
set shiftwidth=2
set softtabstop=2

match ErrorMsg '\s\+$'

if has("gui_running")
  set guifont=Source\ Code\ Pro\ 10
endif

"remove trailing whitespace
nnoremap <Leader>kw :%s/\s\+$//e<CR>

nnoremap <leader>d :NERDTreeToggle<CR>

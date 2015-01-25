set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'justincampbell/vim-eighties'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'ervandew/supertab'

" Colour scheme
Plugin 'tomasr/molokai'

" Erlang
Plugin 'jimenezrick/vimerl'

" Elixir
Plugin 'elixir-lang/vim-elixir'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'wookiehangover/jshint.vim'

" CSS/LESS
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'

call vundle#end()

filetype plugin indent on
syntax on

set noswapfile
set laststatus=2
set number
set ignorecase
set smartcase
set nowrap
set hlsearch
set scrolloff=999 "keep cursor centered

set mouse=a

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Exit insert mode with jk
inoremap jk <Esc>

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Include system specific settings
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

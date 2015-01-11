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

" Colour scheme
Plugin 'tomasr/molokai'

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

colorscheme molokai
let g:molokai_original=1
let g:rehash256=1
set background=dark

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

if has("gui_running")
  set guifont=Source\ Code\ Pro\ 10
endif

"trailing whitespace
match ErrorMsg '\s\+$'
noremap <Leader>kw :%s/\s\+$//e<CR>
noremap <Leader>cs :let @/ = ""<CR>
nnoremap <leader>d :NERDTreeToggle<CR>

let g:eighties_enabled = 1
let g:eighties_minimum_width = 80
let g:eighties_extra_width = 0 " Increase this if you want some extra room
let g:eighties_compute = 1 " Disable this if you just want the minimum + extra

" 80-column line
set colorcolumn=81
highlight! link ColorColumn CursorColumn

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

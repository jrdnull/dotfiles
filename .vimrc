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
Plugin 'elixir-lang/vim-elixir'
Plugin 'wincent/command-t'
Plugin 'airblade/vim-gitgutter'
Plugin 'justincampbell/vim-eighties'
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

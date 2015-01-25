if has("gui_running")
  set guifont=Source\ Code\ Pro\ 10

  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif

colorscheme molokai
let g:molokai_original=1
let g:rehash256=1
set background=dark

" 80-column line
set colorcolumn=81
highlight! link ColorColumn CursorColumn

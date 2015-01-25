function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Highlight trailing whitespace
match ErrorMsg '\s\+$'

" Kill whitespace
nnoremap <Leader>kw :call <SID>StripTrailingWhitespaces()<CR>

" Strip on save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

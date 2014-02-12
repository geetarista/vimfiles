setlocal makeprg=go\ build

" http://stackoverflow.com/questions/18532692/golang-formatter-and-vim-how-to-destroy-history-record
" function! GoFmt()
"   try
"     exe "undojoin"
"     exe "Fmt"
"   catch
"   endtry
" endfunction

" augroup golang
  " au!
  " au BufWritePre <buffer> Fmt
" augroup END

" autocmd FileType go autocmd BufWritePre <buffer> Fmt

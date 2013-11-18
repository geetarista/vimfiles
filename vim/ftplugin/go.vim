let g:gofmt_command='goimports'
let g:godef_split=0
setlocal makeprg=go\ build

" http://stackoverflow.com/questions/18532692/golang-formatter-and-vim-how-to-destroy-history-record
function! GoFmt()
  try
    exe "undojoin"
    exe "Fmt"
  catch
  endtry
endfunction

augroup golang
  au!
  au BufWritePre <buffer> call GoFmt()
augroup END

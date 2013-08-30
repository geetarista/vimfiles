" https://github.com/00010011/x/blob/master/etc/vim/plugin/autocmd.vim
" http://stackoverflow.com/questions/18532692/golang-formatter-and-vim-how-to-destroy-history-record
command! -buffer FmtWithImports call s:GoFormatWithImports()
function! s:GoFormatWithImports()
  " exe "undojoin"
  if executable('goimports')
    let view = winsaveview()
    silent %!goimports
    if v:shell_error
      let errors = []
      for line in getline(1, line('$'))
        let tokens = matchlist(line, '^\(.\{-}\):\(\d\+\):\(\d\+\)\s*\(.*\)')
        if !empty(tokens)
          call add(errors, {"filename": @%,
                \"lnum":     tokens[2],
                \"col":      tokens[3],
                \"text":     tokens[4]})
        endif
      endfor
      if empty(errors)
        % | " Couldn't detect gofmt error format, output errors
      endif
      undo
      if !empty(errors)
        call setloclist(0, errors, 'r')
      endif
      echohl Error | echomsg "Goimports returned error" | echohl None
    endif
    call winrestview(view)
  else
    Fmt
  endif
endfunction

setlocal sw=4 ts=4 sts=4 noexpandtab
setlocal makeprg=go\ build
augroup golang
  au!
  au BufWritePre <buffer> FmtWithImports
augroup END

setlocal sw=4 ts=4 sts=4 noexpandtab
setlocal makeprg=go\ build
augroup golang
  au!
  au BufWritePre <buffer> Fmt
augroup END

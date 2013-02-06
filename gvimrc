if has("gui_macvim")
  set antialias                       " Smooth fonts.
  set encoding=utf-8                  " Use UTF-8 everywhere.
  set guioptions=egmt                 " Tabs, grey menu items, menu bar, tearoff menu items
endif

" Always show the tab bar
set showtabline=2

set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h14

" Always fullscreen to the max
set fuoptions=maxvert,maxhorz

" resize current buffer by +/- 5
" Must be in gvimrc otherwise is overriden by system gvimrc
nnoremap <D-left> :vertical resize -5<cr>
nnoremap <D-down> :resize +5<cr>
nnoremap <D-up> :resize -5<cr>
nnoremap <D-right> :vertical resize +5<cr>

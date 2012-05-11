if has("gui_macvim")
  set antialias                       " Smooth fonts.
  set encoding=utf-8                  " Use UTF-8 everywhere.
  set guioptions=egmrt                " Tabs, grey menu items, menu bar, right scrollbar, tearoff menu items
  set guioptions-=T                   " Hide toolbar.
  set guioptions-=r                   " Hide right scrollbar.
endif

set lines=60
set columns=200
" Leaving out for now since it must be called at the end of vimrc for vundle
" colorscheme ego
" if &background == "dark"
"   set transp=4
" endif
set showtabline=2

set guifont=Meslo\ LG\ M\ DZ:h14

" These two go together if Meslo is not preferred
" set guifont=Menlo\ Regular:h14
" set linespace=6

" set fuoptions=maxvert,maxhorz

" Stolen from Janus
if exists("loaded_nerd_tree")
  augroup AuNERDTreeCmd
  autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
  autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()
endif

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction

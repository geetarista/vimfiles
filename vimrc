" no vi compatibility
set nocompatible

" All plugin/bundle management is separate
if filereadable(expand('~/.vimrc.bundles'))
  source $HOME/.vimrc.bundles
endif

" Syntax highlighting
syntax on

" load filetype plugins/indent settings
filetype plugin indent on

" Show cursor position
set ruler
" Show line and column numbers
set number
" Vertical column
if exists("&colorcolumn")
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" No blinking
set novisualbell
" No noise
set noerrorbells
" No noise in shell
set t_vb=
" Symbols when viewing invisibles
set lcs=nbsp:•,tab:\▸\ ,eol:¬,trail:~,extends:>,precedes:<
" Always show status line
set laststatus=2
set cursorline
" set autoread "Set to auto read when a file is changed from the outside
"Set how many commands to retain in history
set history=100
" Show matching brackets.
set showmatch
" Bracket blinking length (tenths of a second)
set mat=5
" Break lines at whole words only
set linebreak
set wrap
" Visually differentiate a wrapped line from others
set showbreak=↪ " …
set encoding=utf-8 " Necessary to show unicode glyphs

" Wildmenu
if has("wildmenu")
  set wildmenu
  set wildmode=list:longest,list:full
  set wildignore+=*.a,*.o,*.so,*.pyo,*.pyc,*.rbc,*.dSYM,*.beam,*.jar,*.class
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd
  set wildignore+=*.tar.gz,*.tar.bz2,*.zip
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.swo,*.tmp,*.un~,*.log
  set wildignore+=.vagrant/*,env/*,.env/*,node_modules/*,.bundle/*,vendor/*
  set wildignore+=log/*,tmp/*,classes/*,static_components/*,deploy/*
endif

set iskeyword+=_,$,@,%,#,-
" Do not redraw while running macros (faster)
" set lazyredraw
" Display incomplete commands
set showcmd
" Show which mode you're in
set showmode
" multiple buffers
set hidden
" terminal title
set title " titlestring=%t
" set shell=zsh
" Set magic mode for regex matching
set magic
" Use the OS X clipboard
set clipboard=unnamed

" Add buffer to cursor while scrolling
set scrolloff=3
set sidescroll=1
set sidescrolloff=3

" Try not letting the cursor blink
set guicursor+=a:blinkon0

" No Ex Mode
map Q gq

" Disable arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

noremap <F1> <ESC>

" Emacs (terminal) bindings
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <C-g>  <C-c>

"" Folds
" don't fold by default
set nofoldenable
" indent-sensitive folding
" set foldmethod=syntax
" Level of indentation
" set foldleve=1
" deepest fold level
" set foldnestmax=2
" Don't auto fold when a buffer is opened
" set foldlevelstart=99
" Show fold level in the column
" set foldcolumn=2

" save folds on exit
" au BufWinLeave *.* mkview
" automatically load folds silently
" au BufWinEnter *.* silent loadview

augroup restorecursor
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Cursor movement in insert mode
inoremap <c-k> <esc>O
inoremap <c-l> <esc>A
inoremap <c-h> <esc>I
inoremap <c-j> <esc>o

" Make and restore sessions
" set sessionoptions=blank,buffers,curdir,folds,tabpages
" noremap <leader>ms :mksession! ~/.vim/.session<cr>
" noremap <leader>rs :source ~/.vim/.session<cr>

" file explorer
" let g:netrw_liststyle=3 " Use tree-mode as default view
" let g:netrw_list_hide='\.un~'
" let g:netrw_browse_split=4 " Open file in previous buffer
" let g:netrw_preview=1 " preview window shown in a vertically split

" Number formatting (good for incrementing/decrementing numbers)
set nrformats=hex

" Persistent Undo
set undofile

" Do not use swapfiles or backup since writebackup is used
" writebackup is still used, so a copy is always kept in memory
" Do not write backup files to disk
set nobackup
set nowritebackup
" Do not use swapfiles (they have trouble with large files)
set noswapfile

" Omni-completion enhancements (http://vim.wikia.com/wiki/VimTip1386, http://vim.wikia.com/wiki/VimTip1228)
" set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

"" Tabs
" Use 2 spaces for tabs
set tabstop=4
set softtabstop=4
" Automatic indenting
set smarttab
" sets spaces used for indention
set shiftwidth=4
" continue indention from previous line
set autoindent
" tab key inserts spaces instead of tabs
set expandtab
" indent,eol,start
set backspace=2

"" Search
" Highlighted search
set hlsearch
" Highlight search string as you type
set incsearch
" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l
" case-insensitive
set ignorecase
" case-sensitive for expressions
set smartcase
" search next/previous -- center in page (similar to using 'set scroloff=999')
nmap n nzz
nmap N Nzz
nmap * *Nzz

"" Typos
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev E e
cnoreabbrev Tabe tabe
cnoreabbrev Noh noh
nnoremap    K    <Nop>

let mapleader = ","

" Easy no-highight
map <silent> <leader><Esc> :noh<CR>

" Shortcut to toggle list (i for invisibles)
nmap <leader>i :set list!<CR>

" Duplicate visual selection
vmap <C-d> y'>p

" Easier command mode
nnoremap ; :

" Command history
cnoremap <c-k> <up>
cnoremap <c-j> <down>

" Quicker q
map <leader>q :q<CR>
" Quicker w
map <leader>w :w<CR>

"" vimrc
" Fast editing of .vimrc
"<C-W>w
map <leader>v :vsplit ~/.vimrc<CR>
" Fast reloading of the .vimrc
map <silent> <Leader>V :source $MYVIMRC<CR>:noh<CR>:filetype detect<CR>:echo 'vimrc reloaded'<CR>
" When vimrc is edited, reload it
" if has("autocmd")
"   autocmd bufwritepost vimrc source $MYVIMRC
" endif

" Write all buffers when losing focus
" au FocusLost * :wa

" nmap + :res +10
" nmap - :res -10
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
" Opens an edit command with the path of the currently edited file filled in Normal mode: <Leader>ee
map <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" one-key indentation
nmap > >>
nmap < <<

" properly move across lines in wrap mode
nnoremap j gj
nnoremap k gk

"" Splits
" Auto resize splits
autocmd VimResized * wincmd =

" Window
" nmap <leader>sw<left>  :topleft  vnew<CR>
" nmap <leader>sw<right> :botright vnew<CR>
" nmap <leader>sw<up>    :topleft  new<CR>
" nmap <leader>sw<down>  :botright new<CR>

" Buffer
" nmap <leader>s<left>  :leftabove  vnew<CR>
" nmap <leader>s<right> :rightbelow vnew<CR>
" nmap <leader>s<up>    :leftabove  new<CR>
" nmap <leader>s<down>  :rightbelow new<CR>

" opens a vertical split window and switches to it
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l

" nnoremap <Leader>wo <C-w>o
" nnoremap <Leader>wv <C-w>v<C-w>l
" nnoremap <Leader>ws <C-w>s
" nnoremap <Leader>ww <C-w><C-w>

set splitright
set splitbelow

" bind command-] to shift right
nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>

" bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<

nmap <leader>x :!

" select text that was just pasted
" nnoremap <leader>v V`]

" Visually select last edited/pasted text
" nmap gV `[v`]

" noremap <silent> <C-h> :bprev<CR>
" noremap <silent> <C-l> :bnext<CR>
" Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>
" Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

" close buffer
nmap <leader>d :bd<CR>

" write as sudo
ca w!! w !sudo tee > /dev/null %
" command! W w !sudo tee > /dev/null %

" close all buffers
nmap <leader>D :bufdo bd<CR>

" Switch between last two buffers
nnoremap <leader><leader> <c-^>

function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set norelativenumber
  else
    set relativenumber
    set nonumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

nmap <F5> :<C-U>silent make %:r<CR>:redraw!<CR>:!./%:r<CR>

" EXTERNAL COPY / PASTE
" Press F2 before and after pasting from an external Window, not required for
" MacVim
set pastetoggle=<F2>
map <D-v> "+gP<CR>
vmap <D-c> "+y

" Git blame
vmap <Leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p<CR>

" ctags
set tags=.tags;$HOME/.tags
map <leader>e :silent :! ctags --recurse --sort=yes -f .tags<CR>:exe ":echo 'tags generated'"<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"" Spelling/dictionary
" Toggle spell checking
nmap <silent> <leader>sp :set spell!<CR>
set dictionary+=/usr/share/dict/words

" Enter fullscreen on startup
" set fu
" Toggle Fullscreen
nmap <leader>f :set invfu<CR><c-w>=

" Enable compiler support for ruby
compiler ruby

" Easily find a word
" map ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Remove trailing whitespace
map <silent> <leader>rw :%s/\s\+$//<CR>:let @/=''<CR>:exe ":echo 'whitespace removed'"<CR>

" Run Jasmine specs
map <leader>js :!jasmine-node spec --noColor<CR>

" http://vimcasts.org/episodes/bubbling-text/
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" cmap <C-P> <C-R>=expand("%:p:h") . "/"
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Fake '|' as text object
nnoremap di\| T\|d,
nnoremap da\| F\|d,
nnoremap ci\| T\|c,
nnoremap ca\| F\|c,
nnoremap yi\| T\|y,
nnoremap ya\| F\|y,
nnoremap vi\| T\|v,
nnoremap va\| F\|v,

" Fake '/' as text object
nnoremap di/ T/d,
nnoremap da/ F/d,
nnoremap ci/ T/c,
nnoremap ca/ F/c,
nnoremap yi/ T/y,
nnoremap ya/ F/y,
nnoremap vi/ T/v,
nnoremap va/ F/v,

" local variable -> let() { ... }
" function! PromoteToLet()
"   :normal! dd
"   " :exec '?^\s*it\>'
"   :normal! P
"   :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
"   :normal ==
" endfunction
" :command! PromoteToLet :call PromoteToLet()
" :map <leader>p :PromoteToLet<cr>

" Center screen
" https://gist.github.com/1552327
let g:centerinscreen_active = 0
function! ToggleCenterInScreen(desired_width)
  if g:centerinscreen_active == 0
    let l:window_width = winwidth(winnr())
    let l:sidepanel_width = (l:window_width - a:desired_width) / 2

    exec("silent leftabove " . l:sidepanel_width . "vsplit new")
    wincmd l
    exec("silent rightbelow " . l:sidepanel_width . "vsplit new")
    wincmd h
    let g:centerinscreen_active = 1
  else
    wincmd h
    close
    wincmd l
    close
    
    let g:centerinscreen_active = 0
  endif
endfunction

nnoremap <Leader>r :exec ToggleCenterInScreen(100)<CR>

" Three-finger swipe to switch buffers
if has("gui_macvim")
  map <SwipeLeft> :bprev<CR>
  map <SwipeRight> :bnext<CR>
endif

" Show syntax highlighting groups for word under cursor
nmap <F7> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Distraction Free Writing
function! DistractionFreeWriting()
  set lines=40 columns=100           " size of the editable area
  set nonumber
  set nolist
  set fuoptions=background:#001e1e1a " macvim specific setting for editor's background color
  set guioptions-=r                  " remove right scrollbar
  set laststatus=0                   " don't show status line
  set shm=at
  set wrap
  set noruler                        " don't show ruler
  set fullscreen                     " go to fullscreen editing mode
  set linebreak                      " break the lines on words
  set showbreak=
  silent exec 'NeoComplCacheDisable'
  hi NonText    guifg=#1e1e1a
  hi SpecialKey guifg=#1e1e1a
endfunction

" ============== Plugin Settings ===============

" Vundle
" map <leader>vi :BundleInstall<CR>
" map <leader>vc :BundleClean<CR>
" map <leader>vd :BundleUpdate<CR>

" Ack
map <leader>A :Ack<space>
map <leader>a :Ack <C-r><C-w>
map <D-F> :args<space>`ag -l '<C-r><C-w>' .`
let g:ackprg = 'ag --nogroup --nocolor --column'

" Ctrlp
let g:ctrlp_max_files = 10000
map <leader>b :CtrlPBuffer<CR>
map <leader>l :CtrlPLine<CR>
let g:ctrlp_clear_cache_on_exit = 0

" Delete buffer from within CtrlPBuffer
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
  nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
  let line = getline('.')
  let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
  exec "bd" bufid
  exec "norm \<F5>"
endfunc

" Detectindent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
let g:detectindent_max_lines_to_analyse = 1024
augroup detectindent
  autocmd!
  autocmd BufReadPost * :DetectIndent
augroup END

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove
nnoremap <Leader>gg :Ggrep
nnoremap <Leader>gd :Gdiff<CR>

augroup fugitivefix
  autocmd!
  autocmd BufReadPost fugitive:// set bufhidden=delete
augroup END

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" Godef
let g:godef_split=0

" Gundo
map <leader>gu :GundoToggle<CR>

" Indent guides
let g:indent_guides_start_level = 2

" Jinja
augroup jinja
    au!
    au BufNewFile,BufRead *.jinja2,*.j2 set ft=jinja
augroup END

" Markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" NeoComplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#sources#buffer#cache_limit_size = 50000
let g:neocomplete#data_directory = $HOME.'/.vim/cache/noecompl'
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2

" Neosnippet
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" NERD Commenter
let g:NERDSpaceDelims=1

" Powerline
" let g:Powerline_symbols = "fancy"

" Pygments
" let g:rtfp_theme = 'emacs'
" let g:rtfp_font = 'Monaco'

" Startify
let g:startify_session_autoload = 1
let g:startify_bookmarks = [
  \ '~/workspace/puppet',
  \ '~/workspace/kiip',
  \ '~/workspace/launchy',
  \ '~/workspace/vimfiles',
  \ ]

let g:startify_custom_header = [
  \ '',
  \ '                                _________  __  __',
  \ '            __                 /\_____   \/\ \/\ `\',
  \ '   __   __ /\_\    ___ ___     \/____/   /\ \ \ \  \',
  \ '  /\ \ /\ \\/\ \ /` __` __`\        /   /  \ \ \_\  \__',
  \ '  \ \ \_/ / \ \ \/\ \/\ \/\ \      /   / __ \ \___   __\',
  \ '   \ \___/   \ \_\ \_\ \_\ \_\    /\__/ /\_\ \/___/\_\_/',
  \ '    \/__/     \/_/\/_/\/_/\/_/    \/_/  \/_/      \/_/',
  \ '',
  \ '  ======================================================',
  \ '',
  \ ]

" Syntastic
let g:syntastic_puppet_puppetlint_args = '--no-80chars-check --no-double_quoted_strings-check --no-variable_scope-check --no-class_parameter_defaults'
let g:syntastic_python_checkers = ["pyflakes", "pep8"]
let g:syntastic_python_pep8_args='--ignore=E221,E501,E502,W391 --max-line-length=1000'
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': []
  \ }

" Tabular
if exists(":Tabularize")
  nmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t= :Tabularize /=<CR>
  nmap <Leader>t{ :Tabularize /{<CR>
  vmap <Leader>t{ :Tabularize /{<CR>
  nmap <Leader>t: :Tabularize /:\zs<CR>
  vmap <Leader>t: :Tabularize /:\zs<CR>
  nmap <Leader>t, :Tabularize /,\zs<CR>
  vmap <Leader>t, :Tabularize /,\zs<CR>
  nmap <Leader>t> :Tabularize /=><CR>
  vmap <Leader>t> :Tabularize /=><CR>
  nmap <Leader>t\| :Tabularize /\|<CR>
  vmap <Leader>t\| :Tabularize /\|<CR> vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Tagbar
" nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_autofocus = 1

let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

" TComment
noremap <D-/> :TComment<CR>

" UltiSnips
" let g:UltiSnips = {}
" let g:UltiSnips.ExpandTrigger="<c-j>"
" let g:UltiSnips.ExpandTrigger="<tab>"
" let g:UltiSnips.JumpForwardTrigger="<tab>"
" let g:UltiSnips.JumpBackwardTrigger="<s-tab>"

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
set background=dark
" Silently fail on first install
silent! colorscheme lucius
" let g:molokai_original = 0
" highlight ColorColumn guibg=#3D4646 ctermbg=238

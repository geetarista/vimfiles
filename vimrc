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
" set laststatus=2
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
  set wildignore+=*.a,*.o,*.pyc,*.rbc
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.psd
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp,*.un~
  set wildignore+=log/*,tmp/*,script/*,vendor/bundle/*,vendor/plugins/*
  set wildignore+=node_modules,.undodir
endif

" Show two lines in the status bar
set cmdheight=2
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

" Create line above and insert cursor
inoremap <c-k> <esc>O

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
set undodir=~/.vim/undo
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

vmap <C-d> y'>p " Duplicate visual selection

" Easier command mode
nnoremap ; :

" Quicker q
map <leader>q :q<CR>
" Quicker w
map <leader>w :w<CR>

"" vimrc
" Fast editing of .vimrc
map <leader>v :vsplit ~/.vimrc<CR><C-W>
" Fast reloading of the .vimrc
map <silent> <Leader>V :source $MYVIMRC<CR>:noh<CR>:filetype detect<CR>:echo 'vimrc reloaded'<CR>
" When vimrc is edited, reload it
" if has("autocmd")
"   autocmd bufwritepost vimrc source $MYVIMRC
" endif

" Write all buffers when losing focus
au FocusLost * :wa

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
" ca w!! w !sudo tee "%"
cmap w!! %!sudo tee > /dev/null %

" close all buffers
nmap <leader>D :bufdo bd<CR>

" Switch between last two buffers
nnoremap <leader><leader> <c-^>

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" EXTERNAL COPY / PASTE
" Press F2 before and after pasting from an external Window, not required for
" MacVim
set pastetoggle=<F2>
map <D-v> "+gP<CR>
vmap <D-c> "+y

" Git blame
vmap <Leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p<CR>

" ctags
set tags=.tags
map <leader>e :silent :! ctags --recurse --sort=yes -f .tags<CR>:exe ":echo 'tags generated'"<CR>

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
nmap <C-S-P> :call <SID>SynStack()<CR>
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
map <leader>bi :BundleInstall<CR>
map <leader>bc :BundleClean<CR>
map <leader>bd :BundleUpdate<CR>

" Ack
map <leader>A :Ack<space>
map <leader>a :Ack <C-r><C-w>

" Ctrlp
let g:ctrlp_max_files = 10000
let g:ctrlp_map = "<leader>t"

"deploy/|classes/|vendor/|.git/|.hg/|.svn/|.*migrations/|.vagrant" .
let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|class|swp|swo|log|so|o|pyc|pyo|jpe?g|png|gif|mo|po|DS_Store|a|beam|tar.gz|tar.bz2" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ ".git/|.rbc/|.hg/|.svn/|.vagrant/|node_modules/|env/|build/|static/compressed/|.undodir/" .
    \ ")'"

let my_ctrlp_git_command = "" .
    \ "cd %s && git ls-files . -co | " .
    \ ctrlp_filter_greps

if has("unix")
    let my_ctrlp_user_command = "" .
    \ "find %s '(' -type f -or -type l ')' -not -path '*/\\.*/*' | " .
    \ ctrlp_filter_greps .
    \ " | head -" . g:ctrlp_max_files

    let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command, my_ctrlp_user_command]
elseif has('win32')
    let my_ctrlp_user_command = "" .
    \ "dir %s /-n /b /s /a-d" .
    \ ctrlp_filter_greps

    let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command, my_ctrlp_user_command]
else
    let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command]
endif

" Delete buffer from within CtrlPBuf
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    exec "bd" fnamemodify(getline('.')[2:], ':p')
    exec "norm \<F5>"
endfunc

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove
nnoremap <Leader>gg :Ggrep
nnoremap <Leader>gd :Gdiff<CR>

" Gundo
map <leader>gu :GundoToggle<CR>

" Indent guides
let g:indent_guides_start_level = 2

" NERD Commenter
let g:NERDSpaceDelims=1

" Powerline
let g:Powerline_symbols = "fancy"

" Tabular
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  " nmap <Leader>a= :Tabularize /=<CR>
  " vmap <Leader>a= :Tabularize /=<CR>
  " nmap <Leader>a{ :Tabularize /{<CR>
  " vmap <Leader>a{ :Tabularize /{<CR>
  " nmap <Leader>a: :Tabularize /:\zs<CR>
  " vmap <Leader>a: :Tabularize /:\zs<CR>
  " nmap <Leader>a, :Tabularize /,\zs<CR>
  " vmap <Leader>a, :Tabularize /,\zs<CR>
  " nmap <Leader>a> :Tabularize /=><CR>
  " vmap <Leader>a> :Tabularize /=><CR>
  " nmap <Leader>a\| :Tabularize /\|<CR>
  " vmap <Leader>a\| :Tabularize /\|<CR> vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Tagbar
" nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_autofocus = 1

set t_Co=256
set background=dark
colorscheme molokai
" highlight ColorColumn guibg=#3D4646 ctermbg=238

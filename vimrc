call plug#begin()

Plug 'tpope/vim-sensible'

" Plug 'bling/vim-airline'
Plug 'chase/vim-ansible-yaml'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'd11wtq/ctrlp_bdelete.vim'
Plug 'endel/ctrlp-filetype.vim'
Plug 'Raimondi/delimitMate'
Plug 'fatih/vim-go'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'bogado/file-line'
Plug 'tpope/vim-fugitive'
Plug 'aclindsa/detectindent'
Plug 'sjl/gundo.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'IndexedSearch'
Plug 'jelera/vim-javascript-syntax'
Plug 'nanotech/jellybeans.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'jonathanfilip/vim-lucius'
Plug 'tpope/vim-markdown'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
" Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'
Plug 'mhinz/vim-sayonara'
Plug 'derekwyatt/vim-scala'
Plug 'justinmk/vim-sneak'
" Plug 'sourcegraph/sourcegraph-vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
" Plug 'roktas/syntastic-more' " Just to fix appengine imports with goimports
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
" Plug 'Zuckonit/vim-airline-tomato'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/' }
" Plug 'tpope/vim-unimpaired'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-vinegar'
Plug 'NSinopoli/yaml-vim'

call plug#end()

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
set cursorline
" Show matching brackets.
set showmatch
" Bracket blinking length (tenths of a second)
set mat=5
" Break lines at whole words only
set linebreak
set wrap
" Visually differentiate a wrapped line from others
set showbreak=↪ " …

" Wildmenu
if has("wildmenu")
  set wildmenu
  set wildmode=list:longest,list:full
  set wildignore+=*.a,*.o,*.so,*.pyo,*.pyc,*.rbc,*.dSYM,*.beam,*.jar,*.class
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd
  set wildignore+=*.tar.gz,*.tar.bz2,*.zip
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.swo,*.tmp,*.un~,*.log
  set wildignore+=.vagrant/,env/,.env,node_modules/,.bundle/,vendor/
  set wildignore+=log/,tmp/,classes/,static_components/,deploy/,_site/
endif

set iskeyword+=_,$,@,%,#,-
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

" Try not letting the cursor blink
set guicursor+=a:blinkon0

" No Ex Mode
map Q gq

noremap <F1> <ESC>

" Emacs (terminal) bindings
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <C-g>  <C-c>

augroup restorecursor
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Cursor movement in insert mode
inoremap <c-k> <esc>O
inoremap <c-l> <esc>A
inoremap <c-h> <esc>I
inoremap <c-j> <esc>o

function! WindowNumber()
  return tabpagewinnr(tabpagenr())
endfunction
function! TrailingSpaceWarning()
  if !exists("b:statline_trailing_space_warning")
    let lineno = search('\s$', 'nw')
    if lineno != 0
      let b:statline_trailing_space_warning = '[trailing:'.lineno.']'
    else
      let b:statline_trailing_space_warning = ''
    endif
  endif
  return b:statline_trailing_space_warning
endfunction

" recalculate when idle, and after saving
augroup statline_trail
  autocmd!
  autocmd cursorhold,bufwritepost * unlet! b:statline_trailing_space_warning
augroup END

set statusline=
set statusline+=%6*%m%r%*                          " modified, readonly
set statusline+=\
set statusline+=%5*%{expand('%:h')}/               " relative path to file's directory
set statusline+=%1*%t%*                            " file name
set statusline+=\
set statusline+=\
set statusline+=%<                                 " truncate here if needed
set statusline+=%5*%L\ lines%*                     " number of lines
set statusline+=\
set statusline+=\
set statusline+=%3*%{TrailingSpaceWarning()}%*     " trailing whitespace

set statusline+=%=                                 " switch to RHS

set statusline+=%5*col:%-3.c%*                      " column
set statusline+=\
set statusline+=\
set statusline+=%2*buf:%-3n%*                      " buffer number
set statusline+=\
set statusline+=\
set statusline+=%2*win:%-3.3{WindowNumber()}%*     " window number


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
" sets spaces used for indention
set shiftwidth=4
" tab key inserts spaces instead of tabs
set expandtab

"" Search
" Highlighted search
set hlsearch
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

" Run current file
nnoremap <F5> :!%:p<CR>

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
map <silent> <leader>V :source $MYVIMRC<CR>:noh<CR>:filetype detect<CR>:echo 'vimrc reloaded'<CR>

" Write all buffers when losing focus
" au FocusLost * :wa

" nmap + :res +10
" nmap - :res -10
" nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
" Opens an edit command with the path of the currently edited file filled in Normal mode: <Leader>ee
map <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" one-key indentation
nmap > >>
nmap < <<

" Select last edited text quickly
nmap vp `[v`]

" properly move across lines in wrap mode
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Yank and keep position in visual mode
vnoremap y myy`y
vnoremap Y myY`y

"" Splits
" Auto resize splits
autocmd VimResized * wincmd =

" Use | and _ to split windows (while preserving original behaviour of [count]bar and [count]_).
nnoremap <expr><silent> <Bar> v:count == 0 ? "<C-W>v<C-W><Right>" : ":<C-U>normal! 0".v:count."<Bar><CR>"
nnoremap <expr><silent> -     v:count == 0 ? "<C-W>s<C-W><Down>"  : ":<C-U>normal! ".v:count."_<CR>"

" Use tab and shift-tab to cycle through windows.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

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
imap <D-]> <C-O>>

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
" close all buffers
nmap <leader>D :bufdo bd<CR>

" write as sudo
ca w!! w !sudo tee > /dev/null %
" command! W w !sudo tee > /dev/null %

" Switch between last two buffers
nnoremap <leader><leader> <c-^>

function! NumberToggle()
  if(&relativenumber == 1)
    set number norelativenumber
  else
    set relativenumber nonumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

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

" Easily find a word
" map ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Remove trailing whitespace
map <silent> <leader>rw :%s/\s\+$//<CR>:let @/=''<CR>:exe ":echo 'whitespace removed'"<CR>

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

" {{{ ============== Macros ===============
" http://vim.wikia.com/wiki/Macros
    "
let @q = 'i"{{ a }}"F"'
" }}}

" {{{ ============== Plugin Settings ===============

" Ack
" map <leader>A :Ack<space>
" map <leader>a :Ack <C-r><C-w>
" map <D-F> :args<space>`ag -l '<C-r><C-w>' .`
" let g:ackprg = 'ag --nogroup --nocolor --column'

" Airline
let g:airline_powerline_fonts = 1

" Ctrlp
let g:ctrlp_max_files = 10000
map <leader>b :CtrlPBuffer<CR>
map <leader>l :CtrlPLine<CR>
let g:ctrlp_clear_cache_on_exit = 0

" ctrlp_bdelete
call ctrlp_bdelete#init()

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

" Go
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_snippet_engine = "neosnippet"

" Gundo
map <leader>gu :GundoToggle<CR>

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
let g:neocomplete#sources#buffer#cache_limit_size = 5000
let g:neocomplete#data_directory = $HOME.'/.vim/cache/noecompl'
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Nerdtree
map <leader>n :NERDTreeToggle<CR>

" Platinum searcher
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

" Powerline
let g:Powerline_symbols = "fancy"

" Python
autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4

" Syntastic
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args='--ignore=E221,E501,E502,W391 --max-line-length=1000'
let g:syntastic_go_checkers = ["go", "gofmt", "golint", "govet"]

" Tagbar
nmap <leader>t :TagbarToggle<CR>

" Tomato
let g:tomato#show_clock = 0

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

" YAML
au BufNewFile,BufRead *.yaml,*.yml setf yaml

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
set background=dark
" Silently fail on first install
silent! colorscheme lucius
" let g:molokai_original = 0
" highlight ColorColumn guibg=#3D4646 ctermbg=238

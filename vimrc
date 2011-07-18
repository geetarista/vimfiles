" no vi compatibility
set nocompatible

" load filetype plugins/indent settings
filetype plugin indent on

" Syntax highlighting
syntax on

"""" General settings """"

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
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set cursorline
" set autoread "Set to auto read when a file is changed from the outside
"Set how many commands to retain in history
set history=25
" Show matching brackets.
set showmatch
" Bracket blinking length (tenths of a second)
set mat=5
" Break lines at whole words only
set linebreak
set wrap
" Visually differentiate a wrapped line from others
set showbreak=…
set wildignore+=*.swo,*.swp,*.jpg,*.png,*.gif,.git,log/*,vendor/*,tmp/*,script/*
" Wildmenu
set wildmenu
set wildmode=list:longest
" Show two lines in the status bar
set cmdheight=2
set iskeyword+=_,$,@,%,#,-
" Do not redraw while running macros (faster)
set lazyredraw
" Display incomplete commands
set showcmd
" Show which mode you're in
set showmode
" multiple buffers
set hidden
" terminal title
set title
" indent-sensitive folding
" set foldmethod=indent
" set shell=zsh
" Set magic mode for regex matching
set magic

" No Ex Mode
map Q gq

" Number formatting (good for incrementing/decrementing numbers)
set nrformats=hex

" Undo
" set undofile
" set undodir=~/.vimundo

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
set tabstop=2
" Automatic indenting
set smarttab
" sets spaces used for indention
set shiftwidth=2
" continue indention from previous line
set autoindent
" tab key inserts spaces instead of tabs
set expandtab
" start,indent
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
map <leader><Esc> :noh<CR>

"" Typos
nmap :W :w
nmap :Q :q
nmap :E :e
nmap :Tabe :tabe
nmap :Noh :noh

let mapleader = ","

" Shortcut to toggle list (i for invisibles)
nmap <leader>i :set list!<CR>

vmap <C-d> y'>p " Duplicate visual selection

"" vimrc
" Fast editing of .vimrc
map <leader>v :sp ~/.vimrc<CR>
" Fast reloading of the .vimrc
map <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"" Folds
" save folds on exit
au BufWinLeave *.* mkview
" automatically load folds silently
au BufWinEnter *.* silent loadview

" one-key indentation
nmap > >>
nmap < <<

" search next/previous -- center in page (similar to using 'set scroloff=999')
nmap n nzz
nmap N Nzz
nmap * *Nzz

"" Splits
" Window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

" Buffer
nmap <leader>s<left>  :leftabove  vnew<CR>
nmap <leader>s<right> :rightbelow vnew<CR>
nmap <leader>s<up>    :leftabove  new<CR>
nmap <leader>s<down>  :rightbelow new<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" bind command-] to shift right
nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>

" bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<

nmap <leader>x :!

" ctags
set tags=.tags
map <leader>e :silent :! ctags --recurse --sort=yes -f .tags<CR>:exe ":echo 'tags generated'"<CR>

"" Spelling/dictionary
" Toggle spell checking
nmap <silent> <leader>s :set spell!<CR>
set dictionary+=/usr/share/dict/words

" Toggle Fullscreen
nmap <silent> <leader>f :set invfullscreen <CR>

" Enable compiler support for ruby
compiler ruby

" Easily find a word
map ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Remove trailing whitespace
map <silent> <leader>rw :%s/\s\+$//<CR>:let @/=''<CR>:exe ":echo 'whitespace removed'"<CR>

" http://vimcasts.org/episodes/bubbling-text/
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"ruby omnicomplete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Fold settings
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Manage vundle itself
Bundle 'gmarik/vundle'
map <leader>bi :BundleInstall<CR>

""" Plugins """"

" Ack
Bundle "mileszs/ack"
map <leader>A :Ack<space>

" Align
Bundle "tsaleh/vim-align"

" Cocoa
Bundle "msanders/cocoa.vim"

" Coffee-script
Bundle "kchmck/vim-coffee-script"
" Compile to .js on save
" let coffee_compile_on_save = 1

" Cucumber
Bundle "tpope/vim-cucumber"

" Eco
Bundle "jayferd/eco.vim"

" Ego
Bundle "geetarista/ego.vim"

" Endwise
Bundle "tpope/vim-endwise"

" Erlang
Bundle "oscarh/vimerl"

" Fugitive
Bundle "tpope/vim-fugitive"

" FuzzyFinder
" Bundle "FuzzyFinder"
"" fuzzy finder
" gem install fuzzy_file_finder to work
" map <leader>t :FuzzyFinderTextMate<CR>
" map <leader>R :FuzzyFinderTextMateRefreshFiles<CR>

" Gist
Bundle "mattn/gist-vim"

" Gundo
Bundle "sjl/gundo.vim"
map <leader>gu :GundoToggle<CR>

" Haml
Bundle "tpope/vim-haml"

" HTML5
Bundle "othree/html5.vim"

" Indent guides
Bundle "nathanaelkane/vim-indent-guides"

" Ingretu
Bundle "gmarik/ingretu"

" Jade
Bundle "digitaltoad/vim-jade"

" Javascript
Bundle "pangloss/vim-javascript"

" Jellybeans
Bundle "nanotech/jellybeans.vim"

" Mac classic theme
Bundle "nelstrom/vim-mac-classic-theme"

" Markdown
Bundle "tpope/vim-markdown"

" Markdown preview
Bundle "robgleeson/vim-markdown-preview"

" Matchit
Bundle "mhz/vim-matchit"

" Molokai
Bundle "lukerandall/molokai"

" NERDcommenter
Bundle "scrooloose/nerdcommenter"
let g:NERDSpaceDelims=1

" NERDTree
Bundle "scrooloose/nerdtree"
let NERDTreeShowHidden=1
map <leader>n :NERDTree<CR>
map <leader>d :NERDTreeToggle<CR>

" Pastie
Bundle "tpope/vim-pastie"

" Ragtag
Bundle "tpope/vim-ragtag"

" Rake
Bundle "tpope/vim-rake"

" Rails
Bundle "tpope/vim-rails"

" Repeat
Bundle "tpope/vim-repeat"

" Relative Number
Bundle "vim-scripts/RltvNmbr.vim"

" RSpec
Bundle "taq/vim-rspec"

" Ruby
Bundle "vim-ruby/vim-ruby"

" Ruby debugger
" Bundle "astashov/vim-ruby-debugger"

" SCSS Syntax
Bundle "cakebaker/scss-syntax.vim"

" Shoulda
Bundle "tsaleh/vim-shoulda"

" Showmarks
Bundle "harleypig/ShowMarks"
let g:showmarks_enable=0

" Snipmate
Bundle "git://github.com/msanders/snipmate.vim.git"

" Snipmate snippets
Bundle "git://github.com/scrooloose/snipmate-snippets.git", { 'rtp': 'vim/' }
let g:snippets_dir='~/.vim/bundle/snipmate-snippets,~/.vim/bundle/snipmate-nodejs'

" Snipmate node.js
Bundle "jamescarr/snipmate-nodejs"

" Solarized
Bundle "altercation/vim-colors-solarized"

" Sparkup
Bundle "bingaman/vim-sparkup"

" Specky
Bundle "vim-scripts/Specky"

" Supertab
" Bundle "ervandew/supertab"

" Surround
Bundle "tpope/vim-surround"

" Syntastic
Bundle "scrooloose/syntastic"

" Tabular
Bundle "godlygeek/tabular"

" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Tcomment
Bundle "tsaleh/vim-tcomment"

" https://gist.github.com/287147
" Especially useful for cucumber steps
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Taglist
Bundle "mexpolk/vim-taglist"

" Textobj User
Bundle "kana/vim-textobj-user"

" Textobj Ruby block
Bundle "nelstrom/vim-textobj-rubyblock"

" Unimpaired
Bundle "tpope/vim-unimpaired"

" Vim Kata
Bundle "canadaduane/VimKata"
map <leader>vk :VimKata

" VisIncr
Bundle "vim-scripts/VisIncr"

" Yankring
Bundle "chrismetcalf/vim-yankring"
let g:yankring_history_file='.yankring'


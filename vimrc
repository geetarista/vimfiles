" no vi compatibility
set nocompatible

" Syntax highlighting
syntax on

" load filetype plugins/indent settings
filetype plugin indent on

"""" General settings """"

" Show cursor position
set ruler
" Show line and column numbers
set number
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

" No Ex Mode
map Q gq

" Number formatting (good for incrementing/decrementing numbers)
set nrformats=hex

" Undo
set undofile
set undodir=./.undo

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

nmap <leader>x :! 

" ctags
set tags=.tags
map <leader>e :silent :! ctags --recurse --sort=yes -f .tags<CR>:exe ":echo 'tags generated'"<CR>

"" Spelling/dictionary
" Toggle spell checking
nmap <silent> <leader>s :set spell!<CR>
set dictionary+=/usr/share/dict/words

" Enable compiler support for ruby
compiler ruby

" Easily find a word
map ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Remove trailing whitespace
map <silent> <leader>rw :%s/\s\+$//<CR>:noh<CR>:exe ":echo 'whitespace removed'"<CR>

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

autocmd BufRead,BufNewFile Gemfile  set filetype=Gemfile
autocmd BufRead,BufNewFile *.json   set filetype=json
autocmd BufRead,BufNewFile *.coffee set filetype=coffee

" Fold settings
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

"""" Plugins """"

" Vundle
set rtp+=~/.vim/vundle/
call vundle#rc()
map <leader>bs :BundleSearch 
map <leader>bi :BundleInstall<CR>

" Ack
Bundle "git://github.com/mileszs/ack.vim.git"
map <leader>A :Ack<space>

" Align
Bundle "Align"

" Cocoa
Bundle "cocoa.vim"

" Coffee-script
Bundle "git://github.com/kchmck/vim-coffee-script.git"
let coffee_compile_on_save = 1

" Command-t
" Bundle "git://git.wincent.com/command-t.git"

" Cucumber
Bundle "cucumber.zip"

" Eco
Bundle "git://github.com/jayferd/eco.vim.git"

" Ego
Bundle "git://github.com/geetarista/ego.vim.git"

" Endwise
Bundle "endwise.vim"

" Fugitive
Bundle "git://github.com/tpope/vim-fugitive.git"

" FuzzyFinder
" Bundle "FuzzyFinder"
"" fuzzy finder
" gem install fuzzy_file_finder to work
" map <leader>t :FuzzyFinderTextMate<CR>
" map <leader>R :FuzzyFinderTextMateRefreshFiles<CR>

" Gist
Bundle "Gist.vim"

" Gundo
Bundle "git://github.com/sjl/gundo.vim.git"
map <leader>gu :GundoToggle<CR>

" Haml
Bundle "git://github.com/tpope/vim-haml.git"

" Mac classic theme
Bundle "git://github.com/nelstrom/vim-mac-classic-theme.git"

" Markdown preview
Bundle "git://github.com/robgleeson/vim-markdown-preview.git"

" Matchit
Bundle "git://github.com/mhz/vim-matchit.git"

" NERDTree
" let NERDTreeShowHidden=1
" map <leader>n :NERDTree<CR>
" map <leader>d :NERDTreeToggle<CR>

" NERDcommenter
Bundle "git://github.com/scrooloose/nerdcommenter.git"
let g:NERDSpaceDelims=1

" Pastie
Bundle "pastie.vim"

" Ragtag
Bundle "ragtag.vim"

" Rake
Bundle "git://github.com/tpope/vim-rake.git"

" Rails
Bundle "rails.vim"

" Repeat
Bundle "git://github.com/tpope/vim-repeat.git"

" Relative Number
Bundle "RltvNmbr.vim"

" RSpec
Bundle "git://github.com/taq/vim-rspec.git"

" Ruby
Bundle "git://github.com/vim-ruby/vim-ruby.git"

" SCSS Syntax
Bundle "git://github.com/cakebaker/scss-syntax.vim.git"

" Showmarks
" Bundle "ShowMarks"
" let g:showmarks_enable=0

" Snipmate
Bundle "git://github.com/msanders/snipmate.vim.git"
Bundle "git://github.com/scrooloose/snipmate-snippets.git"
let g:snippets_dir='~/.vim/bundle/snipmate-snippets'

" Sparkup
Bundle "git://github.com/bingaman/vim-sparkup.git"

" Specky
Bundle "git://github.com/vim-scripts/Specky.git"

" Surround
Bundle "surround.vim"

" Syntastic
Bundle "git://github.com/scrooloose/syntastic.git"

" Taglist
Bundle "taglist.vim"

" Unimpaired
Bundle "unimpaired.vim"

" Vim Kata
Bundle "git://github.com/canadaduane/VimKata.git"
map <leader>vk :VimKata 

" VisIncr
Bundle "git://github.com/vim-scripts/VisIncr.git"

" Yankring
Bundle "git://github.com/chrismetcalf/vim-yankring.git"

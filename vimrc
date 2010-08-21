" no vi compatibility
set nocompatible

call pathogen#runtime_append_all_bundles()

" load filetype plugins/indent settings
filetype plugin indent on
"Syntax highlighting
syntax on

"" General settings
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
" Visually differentiate a wrapped line from others
set showbreak=…
set wildignore+=*.swo,*.swp,*.jpg,*.png,*.gif,.git,log/*,vendor/*,tmp/*,script/*
" Show two lines in the status bar
set cmdheight=2
set iskeyword+=_,$,@,%,#,-
" Do not redraw while running macros (faster)
set lazyredraw
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set showcmd
" indent-sensitive folding
" set foldmethod=indent
" set shell=zsh

" Do not use swapfiles or backup since writebackup is used
" writebackup is still used, so a copy is always kept in memory
" Do not write backup files to disk
set nobackup
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
map <leader><Esc> :noh<CR>

"" Typos
nmap :W :w
nmap :Q :q
nmap :E :e
nmap :Tabe :tabe
nmap :Noh :noh

let mapleader = ","

"" fuzzy finder
" gem install fuzzy_file_finder to work
map <leader>t :FuzzyFinderTextMate<CR>
map <leader>R :FuzzyFinderTextMateRefreshFiles<CR>

"" Nerdtree
let NERDTreeShowHidden=1
map <leader>n :NERDTree<CR>
map <leader>d :NERDTreeToggle<CR>

" Shortcut to toggle list (i for invisibles)
nmap <leader>i :set list!<CR>

vmap <C-d> y'>p " Duplicate visual selection

"" vimrc
" Fast editing of .vimrc
map <leader>v :sp ~/.vimrc<CR>
" Fast reloading of the .vimrc
map <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" When .vimrc is edited, reload it
autocmd! bufwritepost vimrc sourc ~/.vimrc

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

" Ack function
map <leader>A :Ack<space>

" Update help tags
map <leader>h :call pathogen#helptags()<CR>

" Enable compiler support for ruby
compiler ruby

" NERDCommenter
let g:NERDSpaceDelims=1

" Snipmate
let g:snippets_dir='~/.vim/snippets'

" Easily find a word
map ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Remove trailing whitespace
map <silent> <leader>rw :%s/\s\+$//<CR>:noh<CR>:exe ":echo 'whitespace removed'"<CR>

let g:showmarks_enable=0

"ruby omnicomplete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

autocmd BufRead,BufNewFile Gemfile set filetype=Gemfile

au! BufRead,BufNewFile *.json setfiletype json

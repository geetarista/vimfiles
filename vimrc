" no vi compatibility
set nocompatible

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
set encoding=utf-8 " Necessary to show unicode glyphs

" Wildmenu
if has("wildmenu")
  set wildmenu
  set wildmode=list:longest
  set wildignore+=*.a,*.o
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp,*.un~
  set wildignore+=log/*,tmp/*,script/*,vendor/bundle/*,vendor/plugins/*
endif

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
" set shell=zsh
" Set magic mode for regex matching
set magic
" Use the OS X clipboard
set clipboard=unnamed

" No Ex Mode
map Q gq

"" Folds
" don't fold by default
" set nofoldenable
" indent-sensitive folding
set foldmethod=syntax
" deepest fold level
" set foldnestmax=2
" Don't auto fold when a buffer is opened
set foldlevelstart=99
" save folds on exit
" au BufWinLeave *.* mkview
" automatically load folds silently
" au BufWinEnter *.* silent loadview
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" file explorer
" let g:netrw_liststyle=3 " Use tree-mode as default view
" let g:netrw_list_hide='\.un~'
" let g:netrw_browse_split=4 " Open file in previous buffer
" let g:netrw_preview=1 " preview window shown in a vertically split

" Number formatting (good for incrementing/decrementing numbers)
set nrformats=hex

" Undo
set undofile
set undodir=~/.vimundo

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

"" Typos
nmap :W :w
nmap :Q :q
nmap :E :e
nmap :Tabe :tabe
nmap :Noh :noh

let mapleader = ","

" Easy no-highight
map <leader><Esc> :noh<CR>

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
map <leader>v :sp $MYVIMRC<CR>
" Fast reloading of the .vimrc
map <leader>sv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source $MYVIMRC

" Opens an edit command with the path of the currently edited file filled in Normal mode: <Leader>ee
map <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" one-key indentation
nmap > >>
nmap < <<

" search next/previous -- center in page (similar to using 'set scroloff=999')
nmap n nzz
nmap N Nzz
nmap * *Nzz

" properly move across lines in wrap mode
nnoremap j gj
nnoremap k gk

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

noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-l> :bnext<CR>
" Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>
" Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

" close buffer
nmap <leader>d :bd<CR>

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

nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>wo <C-w>o
nnoremap <Leader>wv <C-w>v<C-w>l
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>ww <C-w><C-w>

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

" Run Jasmine specs
map <leader>js :!jasmine-node spec --noColor<CR>

" http://vimcasts.org/episodes/bubbling-text/
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

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


"ruby omnicomplete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Filetypes
if has("autocmd")
  autocmd BufNewFile,BufRead Guardfile set filetype=ruby
  autocmd BufNewFile,BufRead *.json set ft=json
  autocmd BufNewfile,BufRead *.snippets set noexpandtab
  autocmd BufNewfile,BufRead *.pde setf arduino
end

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby

" All plugin/bundle management is separate
source $HOME/.vimrc.bundles

" Initial Setup {{{{

set nocompatible     " get rid of vi compatibility

" change the leader from \ to ,
let mapleader =  ","

" }}}}

" Plugin Setup {{{{

" Install Plugins {{{{

filetype off                    " filetype interferes with vundle

set rtp+=~/.vim/bundle/Vundle.vim  " add vundle to vim runtime
call vundle#begin()                " initialise vundle

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/Vundle.vim'

" A file system explorer
Plugin 'scrooloose/nerdtree'

" Runs external syntax checkers on code
Plugin 'scrooloose/syntastic'

" A fuzzy file finder
Plugin 'kien/ctrlp.vim'

" Solarized colorscheme
Plugin 'altercation/vim-colors-solarized'

" Distinguished colorscheme
Plugin 'Lokaltog/vim-distinguished'

" Seoul256 colorscheme
Plugin 'junegunn/seoul256.vim'

" Line up text
Plugin 'godlygeek/tabular'

" Javascript syntax
Plugin 'jelera/vim-javascript-syntax'

" Better Javascript indenting and highlighting
Plugin 'pangloss/vim-javascript'

" Show indent guides
Plugin 'nathanaelkane/vim-indent-guides'

" Add closing quote/bracket
Plugin 'Raimondi/delimitMate'

call vundle#end()
filetype plugin indent on       " turn filetype, plugin and indent on

" }}}}

" NERDTree Setup {{{{

" Open NERDTree
nmap <leader>nt :NERDTree<CR>

" }}}}

" Syntastic Setup {{{{

" Run syntastic on file open, as well as on save
let g:syntastic_check_on_open=1

" }}}}

" }}}}

" General Functionality {{{{

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set incsearch         " do incremental searching
set autoindent        " always set autoindenting on
set hidden            " handle hidden files better
set confirm           " display confirmation for unsaved changes
set scrolloff=10      " give the cursor lines at the top and bottom
set ignorecase        " ignore case when searching
set smartcase         " case sensitive seacrh if capital letter used
set history=1000      " remember more commands and search history
set undolevels=1000   " use many undos
set tabstop=4         " number of visual spaces per TAB
set softtabstop=4     " number of spaces in TAB when editing
set shiftwidth=4      " number of spaces for reindenting (<<, >>)
set expandtab         " use spaces not tabs
set splitbelow        " open splits to bottom
set splitright        " open vsplits to right
set modelines=1       " Check the final line for a modeline
set pastetoggle=<F2>  " F2 disables autoindent
set lazyredraw        " redraw only when we need to
"set foldenable        " enable folding
"set foldmethod=indent " fold based on indent level

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" }}}}

" General UI {{{{

set ruler	        " show the cursor position all the time
set showcmd	        " display incomplete commands
set nowrap          " don't wrap lines
set relativenumber  " show line numbers relative to current line
set number          " show the line number we're currently on
set cursorline      " highlight line the cursor is on
set title           " change the terminal's title
set showmatch mat=2 " show matching brackets for .2 sec

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" remove toolbars in gui mode, make tabs look better
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%N:%M\ %t
endif

" }}}}

" Colors {{{{

"let g:solarized_termcolors=256
set background=dark
silent! colorscheme seoul256

" }}}}

" Remappings {{{{

" Double clicking searches for current word
noremap <2-LeftMouse> #*
inoremap <2-LeftMouse> #*
  
" Set Y to copy the rest of the line
nnoremap Y y$

" semicolon is easier that colon
nnoremap ; :
vnoremap ; :

" For when you forget to sudo...
cmap w!! silent w !sudo tee % >/dev/null

" Pressing enter in command mode inserts a line
nmap <S-Enter> <S-O><Esc>
nmap <CR> o<Esc>

" }}}}

" Leader Shortcuts {{{{

" quickly edit/reload the vimrc
nmap <silent> <leader>ev :edit $MYVIMRC<CR>
nmap <silent> <leader>sv :write<CR>:source $MYVIMRC<CR>
nmap <silent> <leader>so :source $MYVIMRC<CR>

" clear serch highling
nmap <silent> <leader>/ :nohlsearch<CR>

" Switch to the directory of open buffer
nmap <leader>cd :cd %:p:h<CR>:pwd<CR>

" }}}}

" Navigation {{{{

" Remap navigation to work when text is wrapped
vmap j gj
vmap k gk
vmap $ g$
vmap 0 g0
vmap ^ g^
nmap j gj
nmap k gk
nmap $ g$
nmap 0 g0
nmap ^ g^

" Better way to switch windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" }}}}

" Autocomplete menu {{{{

" Popup menu for autocompleting commands
if has("wildmenu")
    set wildmenu
    set wildmode=longest:full,full
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif

" Set the autocomplete menu to work more like IDE
set completeopt=longest,menuone

" Pressing enter in autocomplete will select the chosen option
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" }}}}

" Custom functions {{{{

" toggle highlighting long lines
fu! LongLineHighlightToggle()
    highlight OverLength ctermbg=darkgrey guibg=#592929
    if exists('w:long_line_match')
        match OverLength //
        unlet w:long_line_match
    else
        match OverLength /\%79v.\+/
        let w:long_line_match = 1
    endif
endfunction
nmap <Leader>l :call LongLineHighlightToggle()<CR>

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
endfunction

" }}}}

" Auto Commands {{{{

" markdown filetype
autocmd BufNewFIle,BufRead *.md set syntax=markdown

" save on focus lost ignoring errors
au FocusLost * silent! wa

" return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" if vim is opened on a directory, auto open NERDTree
if isdirectory(argv(0))
    bd 
    autocmd VimEnter * exe "cd" argv(0)
    autocmd VimEnter * NERDTree
endif


" }}}}

" Commands {{{{

" allow wrapping to be easily set
command! -nargs=* Wrap set wrap! linebreak! nolist

" }}}}

" Backups {{{{

" Change the location of swapfiles
" Double slash at the end, make the name of the swap
" be composed of it's path
set backup
set backupdir=$HOME/.vim/swapfiles//,/tmp//
set backupskip=/tmp/*
set directory=$HOME/.vim/swapfiles//,/tmp//
set writebackup

" }}}}

" vim:foldmethod=marker:foldlevel=0

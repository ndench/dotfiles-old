set nocompatible                " get rid of vi compatibility
filetype off                    " filetype interferes with vundle

set rtp+=~/.vim/bundle/vundle/     " add vundle to vim runtime
call vundle#begin()                " initialise vundle

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on       " turn filetype, plugin and indent on


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50  " keep 50 lines of command line history
set ruler	    " show the cursor position all the time
set showcmd	    " display incomplete commands
set incsearch   " do incremental searching
set autoindent  " always set autoindenting on

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

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
  
" Set tabstop, softtabstop asd shiftwidth to 4
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Pressing enter in command mode inserts a line
nmap <S-Enter> <S-O><Esc>
nmap <CR> o<Esc>

set hidden          " handle hidden files better
set confirm         " display confirmation for unsaved changes
set scrolloff=10    " give the cursor lines at the top and bottom
set ignorecase      " ignore case when searching
set smartcase       " case sensitive seacrh if capital letter used
set showmatch mat=2 " show matching brackets for .2 sec
set expandtab       " use spaces not tabs

" Better way to switch windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" remove toolbars in gui mode, make tabs look better
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%N:%M\ %t
endif

" Set the autocomplete menu to work more like IDE
:set completeopt=longest,menuone

" Pressing enter in autocomplete will select the chosen option
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

set nowrap  " don't wrap lines

" allow wrapping to be easily set
command! -nargs=* Wrap set wrap! linebreak! nolist

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

set number      " show line numbers
set cursorline  " highlight line the cursor is on

" Popup menu for autocompleting commands
if has("wildmenu")
    set wildmenu
    set wildmode=longest:full,full
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif

set splitbelow  " open splits to bottom
set splitright  " open vsplits to right

" Double clicking searches for current word
noremap <2-LeftMouse> #*
inoremap <2-LeftMouse> #*

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

" Set Y to copy the rest of the line
nnoremap Y y$

" Markdown filetype
autocmd BufNewFIle,BufRead *.md set syntax=markdown

" Open NERDTree
nmap <leader>nt :NERDTree<CR>

" Save on focus lost ignoring errors
au FocusLost * silent! wa

" change the leader from \ to ,
let mapleader=","

" quickly edit/reload the vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>so :so $MYVIMRC<CR>

set title           " change the terminal's title
set history=1000    " remember more commands and search history
set undolevels=1000 " use many undos

" semicolon is easier that colon
nnoremap ; :

set pastetoggle=<F2> " F2 disables autoindent

" For when you forget to sudo...
cmap w!! w !sudo tee % >/dev/null

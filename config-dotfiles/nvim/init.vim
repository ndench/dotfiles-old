"" Plugins

call plug#begin('~/.local/share/nvim/plugged')

" Generate and manage ctags
Plug 'ludovicchabant/vim-gutentags'

" Git integration
Plug 'tpope/vim-fugitive'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Add `.` repeat functionality to plugins
Plug 'tpope/vim-repeat'

" Surround text with quotes/brackets
Plug 'tpope/vim-surround'

" Easily abbreviate, substitute and coerce words
Plug 'tpope/vim-abolish'

call plug#end()

""" Guentags

let g:gutentags_cache_dir = "~/.tags_cache"


"" General Config

""" Behaviour

let mapleader=","     " set `,` as the leader instead of `\`
set hidden            " handle hidden files better
set confirm           " display confirmation for unsaved changes
set ignorecase        " ignore case when searching
set smartcase         " case sensitive seacrh if capital letter used
set mouse=a           " enable the mouse
set nomodeline        " disable modelines because of security
set nofoldenable      " disable folding, I want to turn it on manually
set foldmethod=syntax " fold based on syntax
set inccommand=nosplit " highlight matches when substituting `%s`
set secure           " foribid autocmd in files not owned by me
"set tagcase=smart    " use smartcase for tags
set scrolloff=20      " give the cursor lines at the top and bottom
set sidescrolloff=20 " give the cursor columns at the sides
set sidescroll=1     " only sidescroll by 1 column at a time

" Restore last known view when opening a file (cursor position and folds)
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

" Set the autocomplete menu to work more like IDE
set completeopt=longest,menuone,preview

" turn off swapfiles and backups
set noswapfile
set nobackup
set nowritebackup

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.local/share/nvim/backups > /dev/null 2>&1
set undodir=~/.local/share/nvim/backups
set undofile

" Popup menu for autocompletion
set wildmode=longest:full,full " complete the logest match then start wildmenu
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set wildignore+=*cache*,*logs*
set wildignore+=*node_modules/**



""" Changes to vanilla

" disable ex mode and one way of getting into cmdwin
nnoremap Q <nop>
"nnoremap :q <nop>

" Remap navigation to work when text is wrapped
vnoremap j gj
vnoremap k gk
vnoremap $ g$
vnoremap 0 g0
vnoremap ^ g^
nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap 0 g0
nnoremap ^ g^

" set Y to copy the rest of the line
nnoremap Y y$

" semicolon is easier that colon
nnoremap ; :
vnoremap ; :


""" New behaviour

" insert newlines easily
nnoremap <leader>[ <S-O><Esc>
nnoremap <leader>] o<Esc>

" clear serch highlighting
nnoremap <silent> <leader>/ :nohlsearch<CR>

" for when you forget to sudo...
cnoremap w!! silent w !sudo tee % >/dev/null


""" UI

set number          " show line numbers
set relativenumber  " show line numbers relative to current line
set cursorline      " highlight line the cursor is on
set title           " change the terminal's title
set showmatch mat=2 " show matching brackets for .2 sec
let c_comment_strings=1 " highlight strings inside of comments
let c_space_errors=1  " show trailing whitespace

" highlight all columns after 100
" disabled until I find the right colorscheme
"let &colorcolumn=join(range(101,999),",")
"match ColorColumn "\%101v.\+"
"highlight ColorColumn ctermbg=235 guibg=#2c2d27



""" Formatting

set autoindent        " copy indentation from previous line
set cindent     " automatically indent according to cinwords
set tabstop=4         " number of visual spaces per TAB
set softtabstop=4     " number of spaces in TAB when editing
set shiftwidth=4      " number of spaces for reindenting (<<, >>)
set expandtab         " use spaces not tabs
set nowrap          " don't wrap lines


""" Splits

set splitbelow        " open splits to bottom
set splitright        " open vsplits to right

" Better way to navigate splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

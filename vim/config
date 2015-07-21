" Enable syntax
syntax on

" Make vim modern
set nocompatible

" Disable custom vim title
set titlestring=URxvt\ [vim\ %F]

" Make vim pleby
let g:cua_mode = 3

inoremap :MyTab() <C-X><C-F>

set completeopt=
set wildmenu
set wildmode=longest,list

" Start in insert mode
au BufRead,BufNewFile * start

" Enable line numbers
set number

" Enable intentation lines
set list
set listchars=tab:\┆\ 

" Hide statusbar
set noshowmode

" Enable mouse use in all modes
set mouse=a

" Lines above/below cursor
set scrolloff=5

" Stop wrapping
set nowrap

" Save position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Disable backups
set nobackup
set nowritebackup
set noswapfile
set noundofile

" hdni stuff
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set tabstop=4
set more
set wildmenu
set history=200
set matchtime=2
set autoread
set backspace=indent,eol,start

" Colorscheme TODO
colorscheme vim-color-scheme

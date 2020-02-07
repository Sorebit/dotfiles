" Make vim modern.
set nocompatible

" Enable syntax.
syntax on
set showmatch
set tabstop=4

" Disable the default Vim startup message.
set shortmess+=I

" Enable relative line numbers.
set number
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Backspace over anything.
set backspace=indent,eol,start

" Enable buffer hiding.
set hidden

" Make searching better.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
map <C-a> <Nop>
map <C-x> <Nop>
nmap Q <Nop>

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support in all modes. 
set mouse+=a

" Finally learn to use hjkl.
" In normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Quicker window movement.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Colorscheme
colorscheme vim-color-scheme

" Save position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Lines above/below cursor.
set scrolloff=5

" Longer history.
set history=8192


" --------------------------------------------------------------
" TODO: Old config territory, check again if i want to use those
" --------------------------------------------------------------

" Enable intentation lines
" set list
" set listchars=tab:\┆\ 

" Stop wrapping
" set nowrap

" Disable backups
" set nobackup
" set nowritebackup
" set noswapfile
" set noundofile

" hdni stuff
" set autowrite
" set matchtime=2
" set autoread


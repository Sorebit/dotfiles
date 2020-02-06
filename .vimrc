" Make vim modern.
set nocompatible

" Enable syntax.
syntax on

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
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

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

" Colorscheme
colorscheme vim-color-scheme

" Save position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Lines above/below cursor.
set scrolloff=5

" Longer history.
set history=200

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
" set showmatch
" set autowrite
" set tabstop=4
" set matchtime=2
" set autoread


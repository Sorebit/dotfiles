" Make vim modern.
set nocompatible

" Bind leader to comma
let mapleader=","

"------------------
" Syntax and indent
"------------------

" Enable syntax.
syntax on
set showmatch

" Use 2 spaces instead of tabs
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

filetype plugin indent on " enable file type detection
set autoindent

" Toggle paste mode (fixes autoindentation when pasting)
set pastetoggle=<F3>
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

" Stop wrapping
set nowrap

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

" 'Smooth' scrolling (aka jump by 10 lines)
nnoremap J 10gj
nnoremap K 10gk

" Quicker window movement.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" (Shift)Tab (de)indents code and stays in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Colorscheme
colorscheme vim-color-scheme
highlight ColorColumn ctermbg=black

" Save position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Lines above/below cursor.
set scrolloff=5

" Longer history.
set history=8192

" Hide default mode status
set noshowmode

"--------------
" Plugin config
"--------------

filetype plugin on

" ctrlp
nnoremap ; :CtrlPBuffer<CR>
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
" Close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"-------------
" Local config
"-------------
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif


"---------------------------------------------------------------
" TODO: Old config territory, check again if i want to use those
"---------------------------------------------------------------

" Enable intentation lines
" set list
" set listchars=tab:\┆\ 


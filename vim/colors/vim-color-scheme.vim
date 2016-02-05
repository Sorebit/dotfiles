" Misc stuff
set background=dark

hi clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "custom"

" Colors
hi Normal       ctermfg=none
hi NonText      ctermfg=none
hi comment      ctermfg=8
hi constant     ctermfg=green
hi identifier   ctermfg=magenta
hi statement    ctermfg=darkmagenta 
hi preproc      ctermfg=darkmagenta
hi type         ctermfg=darkmagenta 
hi special      ctermfg=darkblue
hi Underlined   ctermfg=blue cterm=underline
hi label        ctermfg=darkmagenta
hi operator     ctermfg=magenta
hi Function     ctermfg=blue

hi ErrorMsg     ctermfg=red    ctermbg=none
hi WarningMsg   ctermfg=red    ctermbg=none
hi ModeMsg      ctermfg=none
hi MoreMsg      ctermfg=none
hi Error        ctermfg=red    ctermbg=none

hi Todo         ctermfg=none ctermbg=0
hi Cursor       ctermfg=0 ctermbg=8
hi Search       ctermfg=0 ctermbg=9
hi IncSearch    ctermfg=0 ctermbg=9
hi LineNr       ctermfg=0
hi SpecialKey   ctermfg=0
hi NonText      ctermfg=0
hi title        cterm=bold

hi VertSplit    ctermfg=blue ctermbg=blue

hi CursorLine   cterm=none ctermbg=none ctermfg=none
hi CursorLineNr cterm=none ctermbg=none ctermfg=8
hi MatchParen   cterm=none ctermbg=0    ctermfg=12

hi Visual term=reverse ctermfg=white ctermbg=black

hi DiffChange   ctermbg=darkGreen  ctermfg=black
hi DiffText     ctermbg=lightGreen ctermfg=black
hi DiffAdd      ctermbg=blue       ctermfg=black
hi DiffDelete   ctermbg=cyan       ctermfg=black

hi Folded       ctermbg=yellow ctermfg=black
hi FoldColumn   ctermbg=gray   ctermfg=black
hi cIf0         ctermfg=gray


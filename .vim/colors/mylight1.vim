
" For using with urxvt/xterm -name theme-mytheme1

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists('syntax_on')
  syntax reset
endif

let colors_name  =  'mylight1'

highlight MatchParen ctermbg = 2 ctermfg = 1

"
" Visual selection. Very light yellow.
"
highlight Visual ctermbg = 228

"
" Selected item in popup menu.
"
highlight PmenuSel ctermbg = 13 ctermfg = white



highlight Comment ctermfg = 4
highlight Constant ctermfg = 1
highlight Folded ctermbg = 250

"
" ‘listchars’ colors.
"
"   :help hl-SpecialKey
"   :help 'listchars'
"   :help cterm-colors
"
highlight SpecialKey ctermfg=8

"
" For Vertical Split (also NERDTree divisor).
"
highlight VertSplit cterm=NONE ctermbg=255

" quickfix syntastic error
" 202: yellowish
highlight Search ctermbg = 202
" :help hl-Search. It is also used for the current, selected line in
" the quickfix window (which syntastic uses).
highlight Search ctermbg=222 ctermfg=202

" 15 almost white
" 248 grayish
" 249 lighter than 248
let g:indentLine_color_term = 249

"
" Errors and Warnings
"
"
highlight SpellBad term=NONE cterm=undercurl
highlight SpellCap term=NONE cterm=undercurl
highlight SpellRare term=NONE cterm=undercurl
highlight SpellLocal term=NONE cterm=undercurl
highlight CocErrorHighlight term=NONE cterm=undercurl
highlight CocWarningHighlight term=NONE cterm=undercurl
highlight CocInfoHighlight term=NONE cterm=undercurl
highlight CocHintHighlight term=NONE cterm=undercurl


"
" GitGutter
"
highlight clear SignColumn

" vim: sw=2

AirlineTheme xtermlight


" hi Normal ctermbg=230 ctermfg=240
" " No reverse, very light yellow selection.
hi Visual cterm=NONE ctermbg=229
" let g:indentLine_color_term = 187
" let g:indentLine_bgcolor_term = 230
" hi CursorLine ctermbg=229
let g:gitgutter_override_sign_column_highlight=0
hi SignColumn ctermbg=7 guibg=NONE
hi GitGutterAdd ctermbg=7 guibg=NONE
hi GitGutterChange ctermbg=7 guibg=NONE
hi GitGutterDelete ctermbg=7 guibg=NONE
" hi ColorColumn ctermbg=229
hi Pmenu cterm=NONE ctermbg=230
hi PmenuSel ctermbg=3 ctermfg=228

hi CocUnderline cterm=undercurl gui=undercurl

""
" Make some special chars like
"
"   tab:␉\ ,trail:·
"
" display 	and other special stuff without the different background
" color behind it.
"
highlight SpecialKey ctermbg=NONE guibg=NONE

""
" Folded text contains an underline which I find somewhat ugly on my
" setup. Instead of bold and underline, let's make it just bold.
"
hi Folded cterm=bold

hi Comment gui=NONE

"
" pacha/vem-tabline overrides
"
hi TabLine cterm=NONE
hi TabLineSel cterm=NONE ctermbg=7 ctermfg=1

" vim: set tw=72:

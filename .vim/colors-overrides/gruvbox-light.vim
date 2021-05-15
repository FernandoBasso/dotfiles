
"
" Not looking good with all the rest of the yellowish stuff.
"
" set cursorline

""
" Background.
"
hi Normal ctermbg=230 ctermfg=240

""
" Make the background of folded lines a bit more yellowish than the
" background.
"
hi Folded ctermbg=229
hi FoldColumn ctermbg=229

""
" Visual selections.
"
" No reverse, very light orange selection.
"
hi Visual cterm=NONE ctermbg=222

""
" Search
"
" Light yellow bg with red fg.
"
hi Search cterm=NONE ctermbg=229 ctermfg=1

""
" Block of the current line underneath line numbers.
"
hi CursorLineNr ctermbg=bg

hi CocErrorSign ctermbg=229
hi CocWarningSign ctermbg=229
hi CocInfoSign ctermbg=229
hi CocHintSign ctermbg=229

let g:indentLine_color_term = 187
let g:indentLine_bgcolor_term = 230
hi CursorLine ctermbg=229
let g:gruvbox_invert_signs=0
let g:gitgutter_override_sign_column_highlight=0
hi SignColumn ctermbg=229
hi GitGutterAdd ctermbg=229
hi GitGutterChange ctermbg=229
hi ColorColumn ctermbg=229
hi Pmenu ctermbg=229
hi PmenuSel ctermbg=3 ctermfg=229

""
" wfxr/minimap.vim
"
hi MinimapCurrentLine ctermfg=1
let g:minimap_highlight = 'MinimapCurrentLine'


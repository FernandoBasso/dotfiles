" For visual selections. The reverse thing looks ugly. This
" transparent-like grayish thing looks and feels much more pleasant.
highlight Visual cterm=NONE gui=NONE ctermbg=234 guibg=#393939
hi Folded ctermbg = 236
hi CursorLine ctermbg = 236

""
" Search.
"
" Blue fg with bg a little less dark than the BG.
"
" hi Search cterm=NONE ctermfg=1 ctermbg=239

"
" Strings should be more redish.
"
highlight String ctermfg=1

"
" Let's highlight some other “keywords” besides “TODO”.
"
" @TODO @WORKING @FIXME:
"
" REDish colors: 88, 124, 160, 196
"
hi MyKeyWords ctermfg=196
match MyKeyWords /@\?\(TODO\|FIXME\|WORKING\|HACK\):\?/


" No menu bar
set guioptions-=m
"set guioptions-=M
" No toolbar
set guioptions-=T

" Desabilita todos os scrollbars.
" Right-hand scrollbar when thereis a vertially split window
set guioptions-=R
" Left-Hand scrollbar
set guioptions-=L
" Left-hand scrollbar when vertically split window
set guioptions-=l
" Bottom horizontal scrollbar
set guioptions-=b
" Habilitar o icone.
set guioptions=i
" Right-hand scrollbar
set guioptions+=r
" Right scroolbar when there are splits (NERDtree, taglist).
set guioptions+=R
set guioptions+=L
set guioptions+=e

set lines=45
set columns=120

highlight Comment guifg=#aeaeae
highlight SpecialKey guifg=#cccccc


set guifont=Ubuntu\ Mono\ 13

set guicursor=n-c:hor14,i:ver14,a:blinkon0

let g:molokai_original = 1
colorscheme molokai

set showcmd

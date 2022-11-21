""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC — Conquer of Completion
" ---------------------------
"
"
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-solargraph',
      \ 'coc-yaml',
      \ 'coc-css',
      \ ]

"
" “Go To” code navigation.
"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <Leader>\ <Plug>(coc-codeaction)

"
" Suggest semantic completions with Ctrl+Tab. Works really well,
" and handles suggestions of object properties. Example:
"
" type TParams {
"   url: string,
"   method: string,
" }
"
" Now, typing “const params: TParams { <C-Space>” displays
" url, method, and their types and even documentation,
" if available.
"
inoremap <silent><expr> <C-Space> coc#refresh()

"
" Display diagnostics (errors and warnings) and documentation.
" Type uppercase ‘K’ to activate, and any motion (like ‘j’, ‘k’,
" ‘h’, ‘b’, ‘<C-o>’, ‘<C-i>’, etc.) to deactivate.
"
nnoremap <silent> K :call CocAction('doHover')<CR>

"
" Navigate to next/prev errors.
"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"
" Rename symbol
"
nmap <leader>rn <Plug>(coc-rename)


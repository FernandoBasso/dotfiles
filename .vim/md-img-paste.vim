"
" https://github.com/md-img-paste-devs/md-img-paste.vim
"

"
" Paste image inside .adoc (Asciidoc[tor]) document.
"
"   image::./img/<name>[Image Description]
"
function! g:AsciidocPasteImage(relpath)
    execute "normal! iimage::" . a:relpath . "[I"
    let ipos = getcurpos()
    execute "normal! a" . "mage Description]"
    call setpos('.', ipos)
    execute "normal! ve\<C-g>"
endfunction

autocmd FileType asciidoctor let g:PasteImageFunction = 'g:AsciidocPasteImage'

"
" Type <Leader>p (\p) to paste the image.
"
autocmd FileType asciidoctor nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>


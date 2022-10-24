"
" https://github.com/md-img-paste-devs/md-img-paste.vim
"

"
" Image dir based on buffer name, like Typora.
"
" This allows moving the document with its assets without any problems
" with broken asset links.
"
" If buffer/file is intro.adoc, assets dir will be `intro.assets`.
"
let g:mdip_imgdir_bufname = 1

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


"
" Uses ripgrep go search for text. Unlike the default Rg fim fzf command,
" this version allows the use of `--type`. It requires an initial search
" pattern.
"
" Examples:
"
" Searches for ‘Login’ with uppercase “L” (smart-case).
"
"   :MRg! -t css Login
"
" The results can be further filtered. That is, type the above
" command followed by other chars, like ‘form’ to further limit the
" search to files which contain ‘Login’ and match files relating
" to ‘form’.
"
command! -bang -nargs=* MRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.<q-args>, 1,
  \   fzf#vim#with_preview('right:50%'), <bang>0)


""
" Open Rg horizontally, on the right! I use this when I have a wide vim
" window, like when vim is fullscreen.
"
" Usage:
"
"   :RGH [SEARCH]
"
" Examples:
"
"   :RGH<CR> ...then start typing some query...
"
"   :RGH query ...then type more to further refine the search...
"
command! -bang -nargs=* RGH
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview('right:50%'),
  \ <bang>0)

""
" Open Rg vertically, above! I use this when I have a tall, but narrow
" vim window, like when vim is tiled to the left and some other application
" is tiled to the right.
"
" Usage:
"
"   :RGV [SEARCH]
"
" Examples:
"
"   :RGV<CR> ...then start typing some query...
"
"   :RGV query ...then type more to further refine the search...
"
command! -bang -nargs=* RGV
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview('up:50%'),
  \ <bang>0)

nnoremap <Leader>rg :MRg! -t

nnoremap <Leader>rh :RGH<CR>
nnoremap <Leader>rv :RGV<CR>

"
" Uses --fixed-strings (or -F) to allow string searches not requiring
" escaping especial characters.
"
command! -bang -nargs=* RGVt
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -F -- ".shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview('up:50%'),
  \ <bang>0)

"
" Uses --fixed-strings (or -F) to allow string searches not requiring
" escaping especial characters.
"
command! -bang -nargs=* RGHt
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -F -- ".shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview('right:50%'),
  \ <bang>0)

nnoremap <Leader>rht :RGHt
nnoremap <Leader>rvt :RGVt

"
" FZF Buffers with --keep-right so lines are trimmed to the left
" instead of to the right when they don't fit on the available space.
" It helps to see the actually filenames and their extensions.
"
command! -bang -nargs=* FZFBuffersKeepRight
  \ call fzf#vim#buffers(
  \   <q-args>,
  \   fzf#vim#with_preview({'options': ['--keep-right']}),
  \ <bang>0)

nnoremap <Leader>bb :FZFBufKeepRight<CR>

command! -bang -nargs=* FZFGitFilesKeepRight
  \ call fzf#vim#gitfiles(
  \   <q-args>,
  \   fzf#vim#with_preview({'options': ['--keep-right']}),
  \ <bang>0)

nnoremap <Leader>gf :FZFGitFilesKeepRight<CR>

command! -bang -nargs=* FZFFilesKeepRight
  \ call fzf#vim#files(
  \   <q-args>,
  \   fzf#vim#with_preview({'options': ['--keep-right']}),
  \ <bang>0)

nnoremap <Leader>f :FZFFilesKeepRight<CR>

""
" https://prettier.io/docs/en/vim.html
"
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

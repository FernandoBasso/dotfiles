return {
  'junegunn/fzf.vim',
  dependencies = {
    'junegunn/fzf'
  },

  config = function()
    vim.cmd [[

    "let g:fzf_colors =
    "  \ { 'fg':      ['fg', 'Normal'],
    "  \ 'bg':      ['bg', 'Normal'],
    "  \ 'hl':      ['fg', 'Comment'],
    "  \ 'fg+':     ['fg', 'Error'],
    "  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    "  \ 'hl+':     ['fg', 'Statement'],
    "  \ 'info':    ['fg', 'PreProc'],
    "  \ 'gutter':  ['bg', 'CursorLine'],
    "  \ 'border':  ['fg', 'Ignore'],
    "  \ 'prompt':  ['fg', 'Conditional'],
    "  \ 'pointer': ['fg', 'Exception'],
    "  \ 'marker':  ['fg', 'Keyword'],
    "  \ 'spinner': ['fg', 'Label'],
    "  \ 'header':  ['fg', 'Comment'] }

    ""
    " Popup Window
    "
    let g:fzf_layout = {
      \ 'window' : {
        \ 'width': 1,
        \ 'height': 1,
        \ 'highlight': 'Normal'
        \ }
      \ }

    ""
    " Split the preview window on the right for wide terminals, at
    " the top for narrow terminals.
    "
    " NOTE: If the terminal is resized, reload vimrc with
    " `:source $MYVIMRC` to re-evaluate the condition.
    "
    " let g:fzf_preview_window = winwidth(0) < 96 ? 'up:52%' : 'right:52%'

    "
    " Opens preview to the right, unless less than 80 cols, in which case
    " preview upens up. Ctrl-\ to toggle preview visibility, which is
    " shown by default.
    "
    let g:fzf_preview_window = ['right,52%,<80(up,52%)', 'ctrl-\']

    nnoremap <Leader>f :Files<CR>
    nnoremap <Leader>gf :GitFiles<CR>
    " nnoremap <Leader>bb :Buffers<CR>
    nnoremap <Leader>g? :GF?<CR>
    nnoremap <Leader>rg :Rg!<CR>
    nnoremap <Leader>t :Tags<CR>
    nnoremap <Leader>m :Marks<CR>

    let files_to_source = [
          \ '~/work/local/libdev.vim',
          \ '~/work/src/dotfiles/nvim-utils.vim',
          \ '~/work/src/dotfiles/digraphs.vim'
          \ ]

    for file in files_to_source
      if filereadable(expand(file))
        execute 'source' . file
      endif
    endfor
    ]]
  end
}

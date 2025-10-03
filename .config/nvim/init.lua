require('config')
require('core')

vim.cmd [[
  let files_to_source = [
        \ '~/source/local/libdev.vim',
        \ '~/source/dotfiles/nvim-utils.vim',
        \ '~/source/dotfiles/digraphs.vim'
        \ ]

  for file in files_to_source
    if filereadable(expand(file))
      execute 'source' . file
    endif
  endfor
]]

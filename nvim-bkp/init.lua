require('config')
require('core')

vim.cmd [[
  " '~/source/dotfiles/nvim-utils.vim',
  " '~/source/local/libdev.vim',
  let files_to_source = [
        \ '~/source/dotfiles/digraphs.vim'
        \ ]

  for file in files_to_source
    if filereadable(expand(file))
      execute 'source' . file
    endif
  endfor
]]

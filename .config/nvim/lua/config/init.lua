require('config.opts')
require('config.keymaps')
require('config.lsp_info')
require('config.clojure')

------
-- Restore cursor position.
--
vim.cmd [[
  augroup RestoreCursor
    autocmd!
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ let s:line = line("'\"")
      \ | if s:line >= 1 && s:line <= line("$") && &filetype !~# 'commit'
      \      && index(['xxd', 'gitrebase'], &filetype) == -1
      \ |   execute "normal! g`\""
      \ | endif
  augroup END
]]

----
-- Highlight when yanking (copying) text.
--
-- • :help vim.hl.on_yank()
--
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup(
    'my-highlight-yank',
    { clear = true }
  ),
  callback = function()
    vim.hl.on_yank()
  end,
})

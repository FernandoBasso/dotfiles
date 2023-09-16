--
-- ~/.config/nvim/after/ftplugin/haskell.lua
--

local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local def_opts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set('n', '<leader>ca', vim.lsp.codelens.run, opts)
vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature, opts)
vim.keymap.set('n', '<leader>ea', ht.lsp.buf_eval_all, opts)
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
vim.keymap.set('n', '<leader>rf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, def_opts)
vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)

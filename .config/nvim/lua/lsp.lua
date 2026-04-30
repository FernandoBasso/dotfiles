local utils = require('utils')
local keymap = utils.keymap

vim.lsp.enable({
  "jsonls",
  "yamlls",
  "bashls",
  "ts_ls",
  "gopls",
  "lua_ls",
  "cssls",
})

vim.diagnostic.config({
  virtual_text = true,
})

keymap(
  'n',
  'gl',
  function()
    vim.diagnostic.open_float()
  end,
  'Open diagnostic float'
)

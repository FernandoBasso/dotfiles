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

local lsp_highlight_group = vim.api.nvim_create_augroup("LspDocumentHighlight", {
  clear = true
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = lsp_highlight_group,
  buffer = 0,
  callback = vim.lsp.buf.document_highlight,
})

vim.api.nvim_create_autocmd({ "CursorMoved" }, {
  group = lsp_highlight_group,
  buffer = 0,
  callback = vim.lsp.buf.clear_references,
})

keymap(
  'n',
  'gl',
  function()
    vim.diagnostic.open_float()
  end,
  'Open diagnostic float'
)

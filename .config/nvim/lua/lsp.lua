local utils = require('utils')
local keymap = utils.keymap

if vim.env.NVIM_DISABLE_LSP == nil then
  vim.lsp.enable({
    "jsonls",
    "yamlls",
    "bashls",
    "ts_ls",
    -- "denols",
    "gopls",
    "lua_ls",
    "cssls",
    "ruby-lsp",
  })
end

vim.diagnostic.config({
  virtual_text = false,
})

----
-- Not working and causing some warnings from time to time.
--
-- local lsp_highlight_group = vim.api.nvim_create_augroup("LspDocumentHighlight", {
--   clear = true
-- })
--
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = lsp_highlight_group,
--   buffer = 0,
--   callback = vim.lsp.buf.document_highlight,
-- })
--
-- vim.api.nvim_create_autocmd({ "CursorMoved" }, {
--   group = lsp_highlight_group,
--   buffer = 0,
--   callback = vim.lsp.buf.clear_references,
-- })

keymap(
  'n',
  'gl',
  function()
    vim.diagnostic.open_float()
  end,
  'Open diagnostic float'
)

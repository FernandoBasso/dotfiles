-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.

--
-- Remember to create the configs in the lsp directory. The name of the
-- files should match the names used below.
--
vim.lsp.enable({
  'lua_ls',
  'ts_ls',
  'jsonls',
  'yamlls',
  'clojure-lsp',
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.lsp.log.set_level('DEBUG')

      -- TODO: C-Space is not triggering completion.
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end
  end,
})

vim.keymap.set(
  'n',
  'gd',
  vim.lsp.buf.definition,
  { desc = 'LSP: Go to definition' }
)

vim.keymap.set(
  'n',
  'grf',
  vim.lsp.buf.format,
  { desc = 'LSP: Format current document' }
)

vim.keymap.set(
  'n',
  'gl',
  vim.diagnostic.open_float,
  { desc = 'LSP: List current diagnostics in float window' }
)

--
-- See :help diagnostic-toggle-virtual-lines-example.
--
vim.keymap.set('n', 'gK', function()
  local cfg = vim.diagnostic.config()
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = {
      current_line = not cfg.virtual_lines.current_line,
    },
  })
end, { desc = 'Toggle diagnostic virtual_lines' })

vim.diagnostic.config({
  update_in_insert = false,
  virtual_text = false,

  -- virtual_text = {
  --   current_line = true,
  -- },

  -- virtual_lines = true

  virtual_lines = {
    current_line = true,
  },

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
})

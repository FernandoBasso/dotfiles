return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      javascript = { "prettier", stop_after_first = true },
      typescript = { "prettier", stop_after_first = true },
      python = { "autopep8" },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
-- config = function()
--   require('conform').setup({
-- end

local blink_capabilities = require('blink.cmp').get_lsp_capabilities()

return {
  cmd = {
    "ruby-lsp",
  },
  filetypes = {
    "ruby",
  },
  root_markers = {
    "Gemfile",
    ".git",
  },
  capabilities = blink_capabilities,
  init_options = {
    formatter = "rubocop",
    linters = { "rubocop" },
    enabledFeatures = {
      hover = true,
      completion = true,
      definition = true,
    },
    documentHighlight = true,
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}



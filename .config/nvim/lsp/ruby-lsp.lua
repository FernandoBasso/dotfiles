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
  init_options = {
    formatter = "standard",
    linters = { "standard" },
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}


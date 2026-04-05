--
-- Enable this in lsp.lua
--

return {
  cmd = {
    "yaml-language-server",
    "--stdio",
  },
  filetypes = {
    "yaml",
  },
  root_markers = {
    ".git",
    "package.json",
  },
  settings = {
    yaml = {
      -- schemaStore = {
      --   enable = false,
      --   url = "",
      -- },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
}

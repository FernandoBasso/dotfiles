--
-- Enable this in lsp.lua
--

return {
  cmd = {
    "vscode-json-language-server",
    "--stdio",
  },
  filetypes = {
    "json",
    "jsonc",
  },
  root_markers = {
    ".git",
    "package.json",
  },
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true }
    }
  }
}

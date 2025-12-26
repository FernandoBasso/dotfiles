--
-- IMPORTANT: Enable this in lsp.lua
--
-- https://www.andersevenrud.net/neovim.github.io/lsp/configurations/cssls/
--
-- npm install --global vscode-langservers-extracted
--

return {
  cmd = {
    "vscode-css-language-server",
    "--stdio",
  },
  filetypes = {
    "css",
    "scss",
    "less",
  },
  root_markers = {
    ".git",
    "package.json",
  },
  settings = {
    css = {
      validate = true
    },
    scss = {
      validate = true
    },
    less = {
      validate = true
    }
  }
}


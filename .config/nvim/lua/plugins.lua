local g = vim.g
-- local keymap = vim.keymap.set
local silent = { silent = true }

function keymap(mode, keys, action, d)
  vim.keymap.set(
    mode,
    keys,
    action,
    {
      noremap = true,
      silent = true,
      nowait = true,
      desc = d,
    }
  )
end

------------------------------------------------------------------------------
-- NVIM WEB DEVICONS
--
vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

------------------------------------------------------------------------------
-- LUALINE
--
vim.pack.add({
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
})

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
  },
  sections = {
    lualine_c = {
      { 'filename', path = 1 }
    }
  }
})

------------------------------------------------------------------------------
-- NVIM-TREE
--
vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})

keymap(
  "n",
  "<Leader>T",
  "<cmd>:NvimTreeToggle<CR>",
  'NVim-Tree: Toggle'
)


require('nvim-tree').setup({
  update_focused_file = {
    enable = true,
  },

  on_attach = function(bufnr)
    local api = require 'nvim-tree.api'

    local function opts(desc)
      return {
        desc = 'NVim-Tree: ' .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    ----
    -- Enable default keymaps.
    --
    api.config.mappings.default_on_attach(bufnr)

    ----
    -- Some useful custom keymaps.
    --
    vim.keymap.set(
      'n',
      '<C-t>',
      api.tree.change_root_to_parent,
      opts('Up')
    )

    vim.keymap.set(
      'n',
      '?',
      api.tree.toggle_help,
      opts('Help')
    )
  end,
  filters = {
    dotfiles = false,
  },
  view = {
    width = {
      min = 36,
      max = 42,
    },
  },
})

------------------------------------------------------------------------------
-- FZF-LUA
--

vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf_lua_actions = require('fzf-lua.actions')

require('fzf-lua').setup({
  keymap = {
    builtin = {
      ["<C-f>"] = "preview-page-down",
      ["<C-b>"] = "preview-page-up",
      ["<C-p>"] = "toggle-preview",
    },
    fzf = {
      ["ctrl-a"] = "toggle-all",
      ["ctrl-t"] = "first",
      ["ctrl-g"] = "last",
      ["ctrl-d"] = "half-page-down",
      ["ctrl-u"] = "half-page-up",
    }
  },
  actions = {
    files = {
      ["ctrl-q"] = fzf_lua_actions.file_sel_to_qf,
      ["ctrl-n"] = fzf_lua_actions.toggle_ignore,
      ["ctrl-h"] = fzf_lua_actions.toggle_hidden,
      ["enter"]  = fzf_lua_actions.file_edit_or_qf,
    }
  },
  winopts = {
    backdrop = 81,
    width = 0.95,
    height = 0.95,
    preview = {
      layout = "flex",
    },
  },
})

keymap(
  "n",
  "<Leader>fn",
  function() require('fzf-lua').files({ cwd = vim.fn.stdpath("config") }) end,
  "[F]ind [n]ovim configs"
)
keymap(
  "n",
  "<Leader><Leader>",
  function() require('fzf-lua').global() end,
  --
  -- https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#global-picker
  --
  "LSP: Files, $, @ and #"
)
keymap(
  "n",
  "<Leader>ff",
  function() require('fzf-lua').files() end,
  "[F]ind [f]iles in current project"
)
keymap(
  "n",
  "<Leader>fb",
  function() require('fzf-lua').buffers() end,
  "[F]ind [b]uffers in current project"
)
keymap(
  "n",
  "<Leader>fg",
  function() require('fzf-lua').live_grep({ resume = true }) end,
  "[L]ive [g]rep in current project"
)
keymap(
  "n",
  "<Leader>fh",
  function() require('fzf-lua').helptags() end,
  "[F]ind [h]elp tag"
)
keymap(
  "n",
  "<Leader>fk",
  function() require('fzf-lua').keymaps() end,
  "[F]ind [k]eymaps"
)
keymap(
  "n",
  "<Leader>f?",
  function() require('fzf-lua').git_status() end,
  "[F]ind in git status"
)
keymap(
  "n",
  "<Leader>fc",
  function() require('fzf-lua').builtin() end,
  "[F]find builtin [c]ommand"
)
keymap(
  "n",
  "<Leader>fr",
  function() require('fzf-lua').resume() end,
  "[F]ind [r]esume last search"
)
keymap(
  "n",
  "<Leader>fw",
  function() require('fzf-lua').grep_cword() end,
  "[F]ind c[w]ord"
)
keymap(
  "n",
  "<Leader>fW",
  function() require('fzf-lua').grep_cWORD() end,
  "[F]ind c[W]ORD"
)


------------------------------------------------------------------------
-- Built-in LSP comes with several default keymaps as of nvim 0.11.
-- See ../core/lsp.lua. These are some extra keymaps.
keymap(
  "n",
  "<Leader>gd",
  function() require('fzf-lua').lsp_definitions() end,
  "[g]o find LSP [d]efinitions"
)
keymap(
  "n",
  "<Leader>gr",
  function() require('fzf-lua').lsp_references() end,
  "[g]o find LSP [r]eferences"
)
keymap(
  "n",
  "<Leader>gs",
  function() require('fzf-lua').lsp_document_symbols() end,
  "[g]o find LSP document [s]symbols"
)
keymap(
  "n",
  "<Leader>gS",
  function() require('fzf-lua').lsp_live_workspace_symbols() end,
  "[g]o find LSP workspace [S]symbols"
)
keymap(
  "n",
  "<Leader>ld",
  function() require('fzf-lua').lsp_document_diagnostics() end,
  "Find [L]SP [d]ocument diagnostics"
)
keymap(
  "n",
  "<Leader>lD",
  function() require('fzf-lua').lsp_workspace_diagnostics() end,
  "Find [L]SP workspace [s]diagnostics"
)

------------------------------------------------------------------------------
-- MASON,
--
vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },

  --
  -- Activation of schemastore.nvim is done in:
  --
  --   - lsp/jsonls.lua
  --   - lsp/yamlls.lua
  --
  { src = "https://github.com/b0o/schemastore.nvim" },
})

require("mason").setup({
  ensure_installed = {
    "stylua",
    "shellcheck",
    "shfmt",
    "black",
    "isort",
    "flake8",
    "prettierd",
    "eslint_d",
    "typescript-language-server",
    "lua-language-server",

    ----
    -- Handled by ray-x/go.nvim
    --
    -- "gopls",
    --
    "rust-analyzer",
    "clangd",
    "cmake-language-server",
    "bash-language-server",
    "json-lsp",
    "yaml-language-server",
    "html-lsp",
    "css-lsp",
  },
})

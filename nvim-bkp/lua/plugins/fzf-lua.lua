return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzflua = require('fzf-lua')

    fzflua.setup({
      winopts = {
        width = 0.95,
        height = 0.95,
        preview = {
          layout = "flex",
          -- layout = "vertical"
        },
      },
      keymap = {
        builtin = {
          ["<C-t>"]        = "toggle-help",
        },
      },
      actions = {
        files = {
          true,
          ----
          -- Opens the files directly as buffers instead of sendnig
          -- them to the quickfix window.
          --
          ["enter"] = fzflua.actions.file_edit,
        },
      },
    })
  end,
  keys = {
    {
      "<Leader>fn",
      function() require('fzf-lua').files({ cwd = vim.fn.stdpath("config") }) end,
      desc = "[F]ind [n]ovim configs",
    },
    {
      "<Leader><Leader>",
      function() require('fzf-lua').global() end,
      --
      -- https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#global-picker
      --
      desc = "LSP: Files, $, @ and #"
    },
    {
      "<Leader>F",
      function() require('fzf-lua').files() end,
      desc = '[F]ind [f]iles in current project',
    },
    {
      "<Leader>fb",
      function() require('fzf-lua').buffers() end,
      desc = '[F]ind [b]uffers in current project',
    },
    {
      "<Leader>fg",
      function() require('fzf-lua').live_grep({ resume = true }) end,
      desc = '[L]ive [g]rep in current project',
    },
    {
      "<Leader>fh",
      function() require('fzf-lua').helptags() end,
      desc = "[F]ind [h]elp tag",
    },
    {
      "<Leader>fk",
      function() require('fzf-lua').keymaps() end,
      desc = "[F]ind [k]eymaps",
    },
    {
      "<Leader>f?",
      function() require('fzf-lua').git_status() end,
      desc = "[F]ind in git status",
    },
    {
      "<Leader>fc",
      function() require('fzf-lua').builtin() end,
      desc = "[F]find builtin [c]ommand",
    },
    {
      "<Leader>fr",
      function() require('fzf-lua').resume() end,
      desc = "[F]ind [r]esume last search",
    },
    {
      "<Leader>fw",
      function() require('fzf-lua').grep_cword() end,
      desc = "[F]ind c[w]ord",
    },
    {
      "<Leader>fW",
      function() require('fzf-lua').grep_cWORD() end,
      desc = "[F]ind c[W]ORD",
    },


    ------------------------------------------------------------------------
    -- Built-in LSP comes with several default keymaps as of nvim 0.11.
    -- See ../core/lsp.lua. These are some extra keymaps.
    {
      "<Leader>gd",
      function() require('fzf-lua').lsp_definitions() end,
      desc = "[g]o find LSP [d]efinitions",
    },
    {
      "<Leader>gr",
      function() require('fzf-lua').lsp_references() end,
      desc = "[g]o find LSP [r]eferences",
    },
    {
      "<Leader>gs",
      function() require('fzf-lua').lsp_document_symbols() end,
      desc = "[g]o find LSP document [s]symbols",
    },
    {
      "<Leader>gS",
      function() require('fzf-lua').lsp_live_workspace_symbols() end,
      desc = "[g]o find LSP workspace [S]symbols",
    },
    {
      "<Leader>ld",
      function() require('fzf-lua').lsp_document_diagnostics() end,
      desc = "Find [L]SP [d]ocument diagnostics"
    },
    {
      "<Leader>lD",
      function() require('fzf-lua').lsp_workspace_diagnostics() end,
      desc = "Find [L]SP workspace [s]diagnostics"
    },
  },
}

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    winopts = {
      width = 0.95,
      height = 0.95,
      preview = {
        layout = "flex",
      },
    },
  },
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
      "<Leader>ff",
      function() require('fzf-lua').files() end,
      desc = '[F]ind [f]iles in current project',
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
    }
  },
}

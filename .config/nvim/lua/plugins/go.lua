return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
  },

  opts = function()
    require('go').setup({
      lsp_cfg = true,

      ----
      -- Disables things like those “greyed out” types that show
      -- up for iformational purposes.
      --
      lsp_inlay_hints = {
        enable = false
      },
    })

    local format_sync_grp = vim.api.nvim_create_augroup("Format", {
      clear = false,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimport()
      end,
      group = format_sync_grp,
    })
  end,

  event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},
  build = ':lua require("go.install").update_all_sync()',

  keys = {
    {
      '<C-x>T',
      '<cmd>GoTestFile<cr>',
      'n',
      desc = 'Go test current file',
    },
    {
      '<C-x><C-t>',
      '<cmd>GoAlt<cr>',
      'n',
      desc = 'Go alternate file',
    },
  },
}

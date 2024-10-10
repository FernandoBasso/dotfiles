return {
  'ray-x/go.nvim',

  dependencies = {
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
  },

  config = function()
    ----
    -- Format on save.
    --
    local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.go',
      callback = function()
       require('go.format').gofmt()
      end,
      group = format_sync_grp,
    })

    vim.keymap.set(
      'n',
      '<Leader>;',
      function ()
        vim.cmd('GoAlt')
      end,
      {
        desc = 'Go to alternate file'
      }
    )

    vim.keymap.set(
      'n',
      '<Leader><Leader>;',
      function ()
        vim.cmd('GoAlt!')
      end,
      {
        desc = 'Go to alternate file'
      }
    )

    require('mason').setup()
    require('mason-lspconfig').setup()
    require('go').setup({
      lsp_config = true,
      lsp_inlay_hints = {
        enable = false,
      },
    })

    local cfg = require'go.lsp'.config()

    require('lspconfig').gopls.setup(cfg)
  end,

  event = {'CmdlineEnter'},

  ft = {'go', 'gomod'},

  ----
  -- if you need to install/update all binaries
  --
  build = ":lua require('go.install').update_all_sync()"
}

return {
  'ray-x/go.nvim',

  dependencies = {
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
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

    require('go').setup()
  end,

  event = {'CmdlineEnter'},

  ft = {'go', 'gomod'},

  ----
  -- if you need to install/update all binaries
  --
  build = ":lua require('go.install').update_all_sync()"
}

return {
  'ray-x/go.nvim',

  dependencies = {
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },

  config = function()
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

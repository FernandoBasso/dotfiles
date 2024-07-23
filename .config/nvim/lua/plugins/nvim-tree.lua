return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { '<Leader>e', ':NvimTreeToggle<CR>', desc = 'Toggle tree' },
    { '<Leader>ff', ':NvimTreeFindFile<CR>', desc = 'Real in nvim tree' },
  },
  config = function()
    require('nvim-tree').setup({
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
  end,
}


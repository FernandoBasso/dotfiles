return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { '<Leader>nt', ':NvimTreeToggle<CR>', desc = 'Toggle nvim-tree' },
    { '<Leader>nf', ':NvimTreeFindFile<CR>', desc = 'Reveal current file in nvim-tree' },
  },
  config = function()
    require('nvim-tree').setup({
      update_focused_file = {
        enable = true,
      },

      on_attach = function(bufnr)
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return {
            desc = 'nvim-tree: ' .. desc,
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
  end,
}

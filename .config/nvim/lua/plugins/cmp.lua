return { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      ----
      -- Snippet Engine & its associated nvim-cmp source
      --
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          ----
          -- Build Step is needed for regex support in snippets. This
          -- step is not supported in many windows environments. Remove
          -- the below condition to re-enable on windows.
          --
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {},
      },
      'saadparwaiz1/cmp_luasnip',

      -----
      -- Adds other completion capabilities. nvim-cmp does not ship with
      -- all sources by default. They are split into multiple repos for
      -- maintenance purposes.
      --
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      ----
      -- nvim cmp turned off by default.
      --
      vim.g.cmp_toggle = false

      vim.keymap.set(
        'n',
        '<Leader><Leader>c',
        function ()
          vim.g.cmp_toggle = not vim.g.cmp_toggle
          local status

          if vim.g.cmp_toggle then
            status = 'ENABLED'
          else
            status = 'DISABLED'
          end

          print('nvim-cmp', status)
        end,
        { desc = 'toggle nvim-cmp' }
      )

      cmp.setup {
        enabled = function()
          return vim.g.cmp_toggle
        end,

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        ----
        -- Read `:help ins-completion`.
        --
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          ----
          -- Accept ([y]es) the completion.
          -- This will auto-import if your LSP supports it.
          -- This will expand snippets if the LSP sent a snippet.
          --
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          ----
          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          -- ['<CR>'] = cmp.mapping.confirm { select = true },
          -- ['<Tab>'] = cmp.mapping.select_next_item(),
          -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),

          ----
          -- Manually trigger a completion from nvim-cmp.
          -- Generally you don't need this, because nvim-cmp will display
          -- completions whenever it has completion options available.
          --
          ['<C-Space>'] = cmp.mapping.complete {},

          ----
          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion
          -- locations.
          -- <c-h> is similar, except moving you backwards.
          --
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),

          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  }

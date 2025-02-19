return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'go',
      'typescript',
      'javascript',
      'jsdoc',
      'diff',
      'html',
      'lua',
      'luadoc',
      'yaml',
      'json',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
    },

    ----
    -- Autoinstall languages that are not installed
    --
    auto_install = true,

    highlight = {
      enable = true,
      ----
      -- Some languages depend on vim's regex highlighting system (such
      -- as Ruby) for indent rules. If you are experiencing weird
      -- indenting issues, add the language to the list of
      -- additional_vim_regex_highlighting and disabled languages for
      -- indent.
      --
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = {
      enable = true,
      disable = {
        'ruby',

        ----
        -- Somehow not working well with ray-x/go.nvim and causing
        -- wrong indentation on Enter, o or O, etc. Disabling as
        -- it is working fine without it so far.
        --
        'go'
      },
    },
    textobjects = {
      move = {
        enable = true,

        ----
        -- whether to set jumps in the jumplist
        --
        set_jumps = true,

        goto_next_start = {
          ["]m"] = "@function.outer",

          ["]]"] = { query = "@class.outer", desc = "Next class start" },

          ----
          -- You can use regex matching (i.e. lua pattern) and/or pass a
          -- list in a "query" key to group multiple queries.
          --
          ["]o"] = "@loop.*",
          -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
          ----

          ----
          -- You can pass a query group to use query from
          -- `queries/<lang>/<query_group>.scm file in your runtime path.
          --
          -- Below example nvim-treesitter's `locals.scm` and
          -- `folds.scm`. They also provide highlights.scm and
          -- indent.scm.
          --
          ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },

          ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },

        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },

        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },

        ----
        -- Below will go to either the start or the end, whichever is closer.
        -- Use if you want more granular movements
        -- Make it even more gradual by adding multiple queries and regex.
        goto_next = {
          ["]d"] = "@conditional.outer",
        },
        goto_previous = {
          ["[d"] = "@conditional.outer",
        }
      },
    },
  },

  config = function(_, opts)
    ----
    -- See `:help nvim-treesitter`
    -- Prefer git instead of curl in order to improve connectivity in
    -- some environments.
    --
    require('nvim-treesitter.install').prefer_git = true

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)
  end
}

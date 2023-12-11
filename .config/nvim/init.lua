--
-- neovim lua config
-- =================
--
-- Based on:
--
-- • https://github.com/nvim-lua/kickstart.nvim
--

--
-- Install packer
--
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'rasulomaroff/cmp-bufname'
  use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  use {
    'williamboman/mason.nvim'
  }

  use 'gpanders/editorconfig.nvim'

  use 'tpope/vim-fugitive'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }

  use({
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  use 'numToStr/Comment.nvim'

  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  use 'nvim-treesitter/nvim-treesitter'                                           -- Highlight, edit, and navigate code
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-textobjects'                               --  Additional textobjects for treesitter

  -- use 'nvim-treesitter/nvim-treesitter-context'

  use 'uga-rosa/ccc.nvim'

  use 'sainnhe/gruvbox-material'

  use { 'ellisonleao/gruvbox.nvim' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use {
    'mrcjkb/haskell-tools.nvim',
    branch = '2.x.x',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }

  --
  -- Looks like we don't have purescript treesitter parser yet (2022).
  --
  use 'purescript-contrib/purescript-vim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  use 'simrat39/symbols-outline.nvim'

  if vim.fn.has('nvim-0.10') == 1 then
    use({
      'Bekaboo/dropbar.nvim',
    })
  end

  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})

  use 'Olical/conjure'

  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end
  }
  use 'junegunn/fzf.vim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- use {
  --   'romgrk/barbar.nvim',
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  use 'habamax/vim-asciidoctor'

  use 'preservim/vim-markdown'

  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

vim.wo.number = true
vim.o.cursorline = true
vim.cmd [[ set colorcolumn=72,80 ]]

--
-- Indentation with spaces, width of 2 for everything by default.
--
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

--
-- If another plugin (like indent-blankline) is already using a cell
-- to display some character, then listchars will not be able to print
-- a character in that same cell and listchars will appear to not be
-- enabled or working.
--
vim.opt.listchars = {
  tab = '␉ ',
  extends = '⟩',
  precedes = '⟨',
  trail = '·'
}
vim.o.list = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--
-- :help restore-cursor.
--
-- Another option would be farmergreg/vim-lastplace.
--
vim.cmd [[
  autocmd BufRead * autocmd FileType <buffer> ++once
    \ if &ft !~# 'commit\|rebase' && line("'\"") > 1
    \ && line("'\"") <= line("$")
    \ | exe 'normal! g`"'
    \ | endif
]]

--
-- Change to the directory of the current buffer.
--
vim.cmd [[
  nnoremap cd :cd %:h<CR>:pwd<CR>
]]

------------------------------------------------------------------------
-- ellisonleao/gruvbox.nvim
--
vim.o.termguicolors = true

vim.o.background = 'light'

local c_bg = '#ffffd8' -- '#fbf1c7'
local c_color_column = '#f6ebbc' -- '#fbf7c5' -- '#fff3c3' -- '#fef6ba'
local c_cursor_line = c_color_column
local c_string = '#d22626'
local yellow0 = '#ffffd8'
local yellow1 = '#fdfec0'
local yellow2 = '#fdf5b0'
local yellow3 = '#fdf5a0'
local yellow4 = '#fdf590'
local yellow5 = '#fbe77d'
local yellow6 = '#f9f977'
local yellow7 = '#fbfb00'
local orange1 = '#f7d598'
local orange2 = '#ecc682'
require("gruvbox").setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,

   -- Invert background for search, diffs, statuslines and errors.
  inverse = false,

   -- Can be "hard", "soft" or empty string.
  contrast = "hard",

  palette_overrides = {},
  overrides = {
    Normal = { bg = c_bg },
    ColorColumn = { bg = yellow1 },
    CursorLine = { bg = yellow1 },
    Search = { bg = 'yellow' },
    -- String = { fg = c_string },
    Visual = { bg = yellow4 },
  },
  dim_inactive = false,
  transparent_mode = false,
})

vim.cmd("colorscheme gruvbox")

vim.cmd [[
  ""
  " Fix for dropbar strange bg colors.
  "
  " • https://github.com/Bekaboo/dropbar.nvim/issues/118
  "
  highlight WinBar guibg=NONE
]]

--
-- Set completeopt to have a better completion experience.
--
vim.o.completeopt = 'menuone,noselect'

------------------------------------------------------------------------------
-- ## key maps
--
-- See `:help mapleader`
--
-- NOTE: Must happen before plugins are required (otherwise wrong leader
-- will be used).
--
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

----
-- Reload $MYVIMRC.
--
vim.keymap.set(
  'n',
  '<Leader>cr',
  function ()
    vim.api.nvim_cmd(
      {
        cmd = 'source',
        args = {
          vim.fn.expand '$MYVIMRC'
        },
      },
      {}
    )
    print('Reloaded nvim config!')
  end
)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<C-s>', ':update<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:update<CR>')

----
-- To navigate the items on the quickfix list. For example, with
-- fugitive, one can do :0Gclog to open all revisions for the current
-- buffer/file into the quickfix list. Then [q or ]q to go back and
-- forth on the result list.
--
vim.keymap.set('n', '[q', ':cprev<CR>')
vim.keymap.set('n', ']q', ':cnext<CR>')


----
-- Navigate to next and previous buffes more easily.
--
vim.keymap.set('n', '<Leader><Leader>n', ':bnext<CR>')
vim.keymap.set('n', '<Leader><Leader>p', ':bprev<CR>')


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

----
-- Set lualine as statusline.
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
  },
  sections = {
    lualine_c = {
      { 'filename', path = 1 }
    }
  }
}

-- Enable Comment.nvim
require('Comment').setup()

--
-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
-- require('indent_blankline').setup {
--   char = '┊',
--   show_trailing_blankline_indent = false,
-- }

------------------------------------------------------------------------
-- mason
--
require("mason").setup()

local lspconfig = require('lspconfig')

-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}
-- lspconfig.rust_analyzer.setup {
--   -- Server-specific settings. See `:help lspconfig-setup`
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

------------------------------------------------------------------------
-- lsp-config typescript-language-server
--
require'lspconfig'.tsserver.setup{}

------------------------------------------------------------------------
-- lsp-config clangd
--
require'lspconfig'.clangd.setup{}

------------------------------------------------------------------------
-- lsp-config eslint_lsp
--
require'lspconfig'.eslint.setup{}

------------------------------------------------------------------------
-- lsp-config solargraph
--
require'lspconfig'.solargraph.setup{}

------------------------------------------------------------------------
-- nvim-treesitter/nvim-treesitter-context
--
-- require'treesitter-context'.setup{
--   enable = true,
--   max_lines = 0,
--   min_window_height = 0,
--   line_numbers = true,
--   multiline_threshold = 20,
--   trim_scope = 'outer',
--   mode = 'cursor',
--   separator = nil,
--   zindex = 20,
--   on_attach = nil,
-- }

------------------------------------------------------------------------------
-- nvim-cmp
--
local cmp = require'cmp'

--
-- nvim cmp turned off by default.
--
vim.g.cmp_toggle = false

local cmp = require('cmp')

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

cmp.setup({
  enabled = function()
    return vim.g.cmp_toggle
  end,

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),

    ----
    -- Accept currently selected item. Set `select` to `false` to only
    -- confirm explicitly selected items.
    --
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'buffname' },
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
  })
});

--
-- Use buffer source for `/` and `?` (if you enabled `native_menu`,
-- this won't work anymore).
--
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

--
-- Use cmdline & path source for ':' (if you enabled `native_menu`,
-- this won't work anymore).
--
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' },
--   }, {
--     { name = 'cmdline' }
--   })
-- })

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['tsserver'].setup {
  capabilities = capabilities
}

----
-- Toggle LSP Inlay Hints
--
vim.keymap.set(
  'n',
  '<Leader>ih',
  function ()
    vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())

    if vim.lsp.inlay_hint.is_enabled() then
      status = 'ENABLED'
    else
      status = 'DISABLED'
    end

    print('Inlay Hints', status)
  end,
  { desc = 'Toggle LSP Inlay Hints' }
)

------------------------------------------------------------------------------
-- bufferline
--
local bufferline = require('bufferline')

bufferline.setup {
  options = {
    style_preset = {
      bufferline.style_preset.no_italic,
    },
    mode = "buffers",
    numbers = "ordinal",
    show_buffer_close_icons = false,
    diagnostics = "nvim_lsp",
  },
  highlights = {
    fill = {
      bg = '#f9f5d7',
    },
  }
}

vim.cmd [[
  nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
  nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
  nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
  nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
  nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
  nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
  nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
  nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
  nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
  nnoremap <silent><leader>$ <Cmd>BufferLineGoToBuffer -1<CR>

  nnoremap <silent><Leader>n :BufferLineCycleNext<CR>
  nnoremap <silent><Leader>p :BufferLineCyclePrev<CR>

  nnoremap <silent><Leader>mn :BufferLineMoveNext<CR>
  nnoremap <silent><Leader>mp :BufferLineMovePrev<CR>
]]

------------------------------------------------------------------------------
-- ## Gitsigns
--
-- • https://github.com/lewis6991/gitsigns.nvim
--
-- See `:help gitsigns.txt`
--
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map({'n', 'v'}, '<leader>bl', ':Gitsigns blame_line<CR>');
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hr', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

------------------------------------------------------------------------
-- treesitter-playground
--
require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

------------------------------------------------------------------------
-- uga-rosa/ccc.vim
--
local ccc = require("ccc")

ccc.setup({
  highlighter = {
    auto_enable = true,
    lsp = true,
  },
})


-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    'lua',
    'typescript',
    'javascript',
    'jsdoc',
    'python',
    'haskell',
    'ruby',
    'c',
  },

  highlight = { enable = true },
  indent = { enable = false },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

------------------------------------------------------------------------------
-- nvim-tree
--
vim.keymap.set('n', '<Leader>ff', ':NvimTreeFindFile<CR>')

require("nvim-tree").setup({
  view = {
    width = {
      min = 36,
      max = 48,
    },
  },
})

------------------------------------------------------------------------------
-- Toggle Nvim Tree and Symbols outline
--
require("symbols-outline").setup()

vim.keymap.set('n', '<F3>', function() vim.api.nvim_command('NvimTreeToggle') end)
vim.keymap.set('n', '<F4>', function() vim.api.nvim_command('SymbolsOutline') end)

------------------------------------------------------------------------
-- Conjure
--
vim.cmd [[
  let g:conjure#client#scheme#stdio#command = "csi -quiet -:c"
  let g:conjure#client#scheme#stdio#prompt_pattern = "\n-#;%d-> "
]]

------------------------------------------------------------------------------
-- Vim Fugitive Goodies
--
-- When I have nvim-tree and symbols outline open on both sides of the
-- main editing window, I want to first close them before opening vim
-- fugitive Git window on a vertical split.
--
-- Vertical because I like having git info on the left, and I can then
-- open buffers under inspections on the split on the right so I can see
-- the changes in more context when needed.
--
local vert_git = function()
  vim.api.nvim_command('NvimTreeClose')
  vim.api.nvim_command('SymbolsOutlineClose')
  vim.api.nvim_command('vertical Git')
end

vim.keymap.set('n', '<Leader>gg', vert_git)

local grep_ts = function()
  require('telescope.builtin').live_grep({
    serch_dirs = 'src/endpoints',
    type_filter = 'ts',
  })
end

vim.keymap.set('n', '<Leader>\\gt', grep_ts)

------------------------------------------------------------------------
-- Haskell Tools
--
-- See ~/.config/nvim/ftplugin/haskell.lua
--

------------------------------------------------------------------------
-- FZF
--

vim.cmd [[

let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'Error'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'gutter':  ['bg', 'CursorLine'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

""
" Popup Window
"
let g:fzf_layout = {
  \ 'window' : {
    \ 'width': 1,
    \ 'height': 1,
    \ 'highlight': 'Normal'
    \ }
  \ }

""
" Split the preview window on the right for wide terminals, at
" the top for narrow terminals.
"
" NOTE: If the terminal is resized, reload vimrc with
" `:source $MYVIMRC` to re-evaluate the condition.
"
" let g:fzf_preview_window = winwidth(0) < 96 ? 'up:52%' : 'right:52%'

"
" Opens preview to the right, unless less than 80 cols, in which case
" preview upens up. Ctrl-\ to toggle preview visibility, which is
" shown by default.
"
let g:fzf_preview_window = ['right,52%,<80(up,52%)', 'ctrl-\']

nnoremap <Leader>f :Files<CR>
" nnoremap <Leader>gf :GitFiles<CR>
" nnoremap <Leader>bb :Buffers<CR>
" nnoremap <Leader>g? :GF?<CR>
nnoremap <Leader>rg :Rg!<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>m :Marks<CR>

let files_to_source = [
      \ '~/work/local/libdev.vim',
      \ '~/work/src/dotfiles/nvim-utils.vim',
      \ '~/work/src/dotfiles/digraphs.vim'
      \ ]

for file in files_to_source
  if filereadable(expand(file))
    execute 'source' . file
  endif
endfor
]]

------------------------------------------------------------------------
-- habamax/vim-asciidoctor
--
vim.g.asciidoctor_folding = 1

------------------------------------------------------------------------
-- prevervim/markdown
--

--
-- • https://github.com/preservim/vim-markdown/issues/558
--
vim.cmd [[
  let g:vim_markdown_folding_disabled = 1
  let g:markdown_folding = 0
]]

------------------------------------------------------------------------
-- LuaSnip
--

local ls = require("luasnip")

ls.config.set_config {
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
}

--
-- I actually use digraphs quite often so instead of <C-k> as suggested
-- in the docs I'll go with <C-j> to insert a snippet or jump forward
-- to the next node.
--
vim.keymap.set({ 'i', 's' }, '<C-j>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

--
-- <S-Tab> to jump back on snippet nodes.
--
vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set('i', '<c-l>', function()
  if ls.choice_active() then
    ls.change_choice()
  end
end, { silent = true })

require('luasnip.loaders.from_lua').load({
  paths = '~/.config/nvim/snips/'
})

function _G.javascript_indent()
  local line = vim.fn.getline(vim.v.lnum)
  local prev_line = vim.fn.getline(vim.v.lnum - 1)
  if line:match('^%s*[%*/]%s*') then
    if prev_line:match('^%s*%*%s*') then
      return vim.fn.indent(vim.v.lnum - 1)
    end
    if prev_line:match('^%s*/%*%*%s*$') then
      return vim.fn.indent(vim.v.lnum - 1) + 1
    end
  end

  return vim.fn['GetJavascriptIndent']()
end

vim.cmd[[autocmd FileType javascript setlocal indentexpr=v:lua.javascript_indent()]]

--
-- vim: tw=72 ts=2 sts=2 sw=2 et
--

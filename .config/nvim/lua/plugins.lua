local function keymap(mode, keys, action, d)
  vim.keymap.set(
    mode,
    keys,
    action,
    {
      noremap = true,
      silent = true,
      nowait = true,
      desc = d,
    }
  )
end

keymap(
  "n",
  "<leader>ps",
  "<cmd>lua vim.pack.update()<CR>",
  "PACK: Update"
)

------------------------------------------------------------------------------
-- TREE-SITTER
--
-- Some plugins or features require that tree-sitter loaded first, like
-- ray-x/go.nvim, for example, otherwise we get parser errors.
--
vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

local ts = require("nvim-treesitter")

ts.install({
  "lua",
  "vim",
  "vimdoc",
  "query",
  "bash",
  "gitcommit",
  "git_config",
  "gitignore",
  "gitattributes",
  "haskell",
  "ruby",
  "go",
  "gomod",
  "gosum",
  "gotmpl",
  "javascript",
  "typescript",
  "jsdoc",
  "json",
  "json5",
  "jsx",
  "tsx",
  "c",
  "cpp"
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    "lua",
    "vim",
    "vimdoc",
    "query",
    "bash",
    "gitcommit",
    "git_config",
    "gitignore",
    "gitattributes",
    "haskell",
    "ruby",
    "go",
    "gomod",
    "gosum",
    "gotmpl",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "jsx",
    "tsx",
    "jsdoc",
    "json",
    "json5",
    "c",
    "cpp",
  },

  callback = function()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
    -- vim.wo[0][0].foldenable = false
    vim.wo[0][0].foldlevel = 99
    vim.treesitter.start()
  end
})

------------------------------------------------------------------------------
-- NVIM WEB DEVICONS
--
vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

------------------------------------------------------------------------------
-- WHICH KEY
--
vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim" },
})

require("which-key").setup({
  ----
  -- Wait 1.5 seconds before popping up.
  --
  delay = 1500,
})

keymap(
  "n",
  "<leader>?",
  function()
    require('which-key').show({ global = false })
  end,
  "WHICH-KEY: buffer-local keymaps"
)

------------------------------------------------------------------------------
-- LUALINE
--
vim.pack.add({
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
})

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
  },
  sections = {
    lualine_c = {
      { 'filename', path = 1 }
    }
  }
})

------------------------------------------------------------------------------
-- NVIM-TREE
--
vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})

keymap(
  "n",
  "<Leader>T",
  "<cmd>:NvimTreeToggle<CR>",
  'NVim-Tree: Toggle'
)


require('nvim-tree').setup({
  update_focused_file = {
    enable = true,
  },

  on_attach = function(bufnr)
    local api = require 'nvim-tree.api'

    local function opts(desc)
      return {
        desc = 'NVim-Tree: ' .. desc,
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

------------------------------------------------------------------------------
-- FZF-LUA
--

vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf_lua_actions = require('fzf-lua.actions')

require('fzf-lua').setup({
  fzf_colors = true,
  keymap = {
    builtin = {
      ["<C-f>"] = "preview-page-down",
      ["<C-b>"] = "preview-page-up",
      ["<C-p>"] = "toggle-preview",
    },
    fzf = {
      ["ctrl-a"] = "toggle-all",
      ["ctrl-t"] = "first",
      ["ctrl-g"] = "last",
      ["ctrl-d"] = "half-page-down",
      ["ctrl-u"] = "half-page-up",
    }
  },
  actions = {
    files = {
      ["ctrl-q"] = fzf_lua_actions.file_sel_to_qf,
      ["ctrl-n"] = fzf_lua_actions.toggle_ignore,
      ["ctrl-h"] = fzf_lua_actions.toggle_hidden,
      ["enter"]  = fzf_lua_actions.file_edit_or_qf,
    }
  },
  winopts = {
    backdrop = 81,
    width = 0.95,
    height = 0.95,
    preview = {
      layout = "flex",
    },
  },
})

keymap(
  "n",
  "<Leader>fn",
  function() require('fzf-lua').files({ cwd = vim.fn.stdpath("config") }) end,
  "[F]ind [n]ovim configs"
)
keymap(
  "n",
  "<Leader><Leader>",
  function() require('fzf-lua').global() end,
  --
  -- https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#global-picker
  --
  "LSP: Files, $, @ and #"
)
keymap(
  "n",
  "<Leader>ff",
  function() require('fzf-lua').files() end,
  "[F]ind [f]iles in current project"
)
keymap(
  "n",
  "<Leader>fb",
  function() require('fzf-lua').buffers() end,
  "[F]ind [b]uffers in current project"
)
keymap(
  "n",
  "<Leader>fg",
  function() require('fzf-lua').live_grep({ resume = true }) end,
  "[L]ive [g]rep in current project"
)
keymap(
  "n",
  "<Leader>fh",
  function() require('fzf-lua').helptags() end,
  "[F]ind [h]elp tag"
)
keymap(
  "n",
  "<Leader>fk",
  function() require('fzf-lua').keymaps() end,
  "[F]ind [k]eymaps"
)
keymap(
  "n",
  "<Leader>f?",
  function() require('fzf-lua').git_status() end,
  "[F]ind in git status"
)
keymap(
  "n",
  "<Leader>fc",
  function() require('fzf-lua').builtin() end,
  "[F]find builtin [c]ommand"
)
keymap(
  "n",
  "<Leader>fr",
  function() require('fzf-lua').resume() end,
  "[F]ind [r]esume last search"
)
keymap(
  "n",
  "<Leader>fw",
  function() require('fzf-lua').grep_cword() end,
  "[F]ind c[w]ord"
)
keymap(
  "n",
  "<Leader>fW",
  function() require('fzf-lua').grep_cWORD() end,
  "[F]ind c[W]ORD"
)


------------------------------------------------------------------------
-- Built-in LSP comes with several default keymaps as of nvim 0.11.
-- See ../core/lsp.lua. These are some extra keymaps.
keymap(
  "n",
  "<Leader>gd",
  function() require('fzf-lua').lsp_definitions() end,
  "[g]o find LSP [d]efinitions"
)
keymap(
  "n",
  "<Leader>gr",
  function() require('fzf-lua').lsp_references() end,
  "[g]o find LSP [r]eferences"
)
keymap(
  "n",
  "<Leader>gs",
  function() require('fzf-lua').lsp_document_symbols() end,
  "[g]o find LSP document [s]symbols"
)
keymap(
  "n",
  "<Leader>gS",
  function() require('fzf-lua').lsp_live_workspace_symbols() end,
  "[g]o find LSP workspace [S]symbols"
)
keymap(
  "n",
  "<Leader>ld",
  function() require('fzf-lua').lsp_document_diagnostics() end,
  "Find [L]SP [d]ocument diagnostics"
)
keymap(
  "n",
  "<Leader>lD",
  function() require('fzf-lua').lsp_workspace_diagnostics() end,
  "Find [L]SP workspace [s]diagnostics"
)

------------------------------------------------------------------------------
-- MASON,
--
vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },

  --
  -- Activation of schemastore.nvim is done in:
  --
  --   - lsp/jsonls.lua
  --   - lsp/yamlls.lua
  --
  { src = "https://github.com/b0o/schemastore.nvim" },
})

require("mason").setup()

------------------------------------------------------------------------------
-- OUTLINE
--
vim.pack.add({
  { src = "https://github.com/hedyhli/outline.nvim" },
})

require("outline").setup()

keymap(
  "n",
  "<Leader>o",
  "<cmd>Outline<CR>",
  "OUTLINE: toggle"
)

------------------------------------------------------------------------------
-- FUGITIVE (GIT)
--
vim.pack.add({
  { src = "https://github.com/tpope/vim-fugitive" },
})

------------------------------------------------------------------------------
-- GITSIGNS
--
vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
});

require("gitsigns").setup({
  on_attach = function(bufnr)
    local gitsigns = require 'gitsigns'

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = 'Jump to next git [c]hange' })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = 'Jump to previous git [c]hange' })

    map(
      'v',
      '<leader>hs',
      function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end,
      { desc = 'stage git hunk on visual selection' }
    )

    map(
      'v',
      '<leader>hr',
      function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end,
      { desc = 'reset git hunk on visual selection' }
    )

    map(
      'n',
      '<leader>hs',
      gitsigns.stage_hunk,
      { desc = 'git [s]tage hunk' }
    )

    -- map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })

    map(
      'n',
      '<leader>hS',
      gitsigns.stage_buffer,
      { desc = 'git [S]tage buffer' }
    )

    -- map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })

    -- map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })

    map(
      'n',
      '<leader>hp',
      gitsigns.preview_hunk,
      { desc = 'git [p]review hunk' }
    )

    map(
      'n',
      '<leader>hb',
      gitsigns.blame_line,
      { desc = 'git [b]lame line' }
    )

    map(
      'n',
      '<leader>hd',
      gitsigns.diffthis,
      { desc = 'git [d]iff against index' }
    )

    map(
      'n',
      '<leader>hD',
      function()
        gitsigns.diffthis '@'
      end,
      { desc = 'git [D]iff against last commit' }
    )

    map(
      'n',
      '<leader>tb',
      gitsigns.toggle_current_line_blame,
      { desc = '[T]oggle git show [b]lame line' }
    )

    map(
      'n',
      '<leader>tD',
      gitsigns.toggle_deleted,
      { desc = '[T]oggle git show [D]eleted' }
    )
  end,
})

------------------------------------------------------------------------------
-- DROPBAR
--
vim.pack.add({
  { src= "https://github.com/Bekaboo/dropbar.nvim" },
})

------------------------------------------------------------------------------
-- GO
--
-- Run this to install necessary tools:
--
-- :lua require("go.install").update_all_sync()',
-- :GoInstallBinaries
--
vim.pack.add({
  { src = "https://github.com/ray-x/go.nvim" },
  { src = "https://github.com/ray-x/guihua.lua" },
})

require('go').setup({
  lsp_cfg = true,
  lsp_codelens = false,

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

keymap(
  "n",
  "<C-x>T",
  "<cmd>GoTestFile<CR>",
  "GO: test current file"
)

keymap(
  "n",
  "<C-x><C-t>",
  "<cmd>GoAlt<CR>",
  "GO: jump to alternate file"
)

------------------------------------------------------------------------------
-- LUASNIP
--
vim.pack.add({
  { src = "https://github.com/L3MON4D3/LuaSnip" },
})

local luasnip = require('luasnip')

require("luasnip").config.set_config {
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
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

----
--
-- <S-Tab> to jump back on snippet nodes.
--
vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

vim.keymap.set('i', '<c-l>', function()
  if luasnip.choice_active() then
    luasnip.change_choice()
  end
end, { silent = true })

require('luasnip.loaders.from_lua').load({
  paths = {
    '~/.config/nvim/snips/'
  }
})

------------------------------------------------------------------------------
-- BLINK CMP
--
vim.pack.add({
  {
    src = "https://github.com/Saghen/blink.cmp",
    version = "v1",
  }
})

require("blink.cmp").setup({
  keymap = {
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = {},
    ["<S-Tab>"] = {},
    ["<C-f>"] = {},
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
  },
  cmdline = {
    enabled = false,
    completion = { menu = { auto_show = true } },
    keymap = {
      ["<CR>"] = { "accept_and_enter", "fallback" },
    },
  },
  completion = {
    menu = {
      border = nil,
      scrolloff = 1,
      scrollbar = false,
      draw = {
        columns = {
          { "kind_icon" },
          { "label", "label_description", gap = 1 },
          { "kind" },
          { "source_name" },
        },
      },
    },
    documentation = {
      window = {
        border = nil,
        scrollbar = false,
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
      },
      auto_show = true,
      auto_show_delay_ms = 500,
    },
  },
  appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = "mono" },
  snippets = { preset = "luasnip" },
  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
      -- "conjure",
      -- "ripgrep",
    },
    providers = {
      -- conjure = { name = "conjure", module = "blink.compat.source", score_offset = -3 },
      -- ripgrep = { module = "blink-ripgrep", name = "Ripgrep", score_offset = -3 },
    },
  },
})

------------------------------------------------------------------------------
-- SNACKS
--
vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" },
})

keymap(
  "n",
  "<Leader>Ii",
  function()
    print("HOVERING")
    Snacks.image.hover()
  end,
  "Show image in float window"
)

require("snacks").setup({
  bigfile = { enabled = false },
  dashboard = { enabled = false },
  explorer = { enabled = false },
  image = {
    enabled = true,
    inline = false,
    float = true,
    max_width = 100,
    max_height = 100,
  },
  indent = { enabled = true },
  input = {
    enabled = true,
    win = {
      relative = "cursor",
    }
  },
  picker = { enabled = false },
  notifier = { enabled = true },
  quickfile = { enabled = false },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = false },
  words = { enabled = false },
  styles = {
    snacks_image = {
      relative = "cursor",
      -- width = 90,
      -- height = 98,
      border = true,
      focusable = false,
      backdrop = false,
    },
  },
})

------------------------------------------------------------------------------
-- AUTOPAIRS
--
vim.pack.add({
  { src = "https://github.com/windwp/nvim-autopairs" }
})

require("nvim-autopairs").setup({})

------------------------------------------------------------------------------
-- GRUVBOX
--
vim.pack.add({
  "https://github.com/ellisonleao/gruvbox.nvim"
})

require("gruvbox").setup()
vim.cmd.colorscheme("gruvbox")


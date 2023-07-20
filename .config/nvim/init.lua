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
  use 'wbthomason/packer.nvim'                                                    -- Package manager

  use 'neovim/nvim-lspconfig'

  use 'gpanders/editorconfig.nvim'

  use 'tpope/vim-fugitive'                                                        -- Git commands in nvim
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }       -- Add git related info in the signs columns and popups
  use 'numToStr/Comment.nvim'                                                     -- "gc" to comment visual regions/lines
  use 'nvim-treesitter/nvim-treesitter'                                           -- Highlight, edit, and navigate code
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-textobjects'                               --  Additional textobjects for treesitter
  use 'sainnhe/gruvbox-material'
  use { 'ellisonleao/gruvbox.nvim' }
  use { 'sonph/onehalf', rtp = 'vim' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use {
    'mrcjkb/haskell-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      -- 'nvim-telescope/telescope.nvim', -- optional
    },
    branch = '1.x.x', -- recommended
  }

  --
  -- Looks like we don't have purescript treesitter parser yet (2022).
  --
  use 'purescript-contrib/purescript-vim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  use 'simrat39/symbols-outline.nvim'

  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})

  use 'Olical/conjure'

  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end
  }
  use 'junegunn/fzf.vim'

  -- use {
  --   'romgrk/barbar.nvim',
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

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
-- preservim/vim-markdown/issues/558
--
vim.cmd [[
  let g:vim_markdown_folding_disabled = 1
  let g:markdown_folding = 0
]]

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
-- Set colorscheme
--
vim.o.termguicolors = true
vim.cmd [[
  set background=light

  ""
  " Let's make bg transparent so it uses my terminal bg color.
  "
  let g:gruvbox_material_transparent_background = 1

  ""
  " Probably doesn't make any difference with transparent bg.
  "
  let g:gruvbox_material_background = 'hard'

  let g:gruvbox_material_palette = 'material'
  let g:gruvbox_material_disable_italic_comment = 1
  let g:gruvbox_material_diagnostic_text_highlight = 0
  let g:gruvbox_material_diagnostic_line_highlight = 0
  let g:gruvbox_material_diagnostic_virtual_text = 'colored'

  colorscheme gruvbox-material

  let yellow1 = '#fdf5c0'
  let yellow2 = '#fdf5b0'
  let yellow3 = '#fdf5a0'
  let yellow4 = '#fdf590'
  let yellow5 = '#fbe77d'
  let orange1 = '#f7d598'
  let orange2 = '#ecc682'

  call gruvbox_material#highlight('CursorLine', ['NONE', 'NONE'], [yellow1, '140'])
  call gruvbox_material#highlight('CursorLineNr', ['NONE', 'NONE'], [yellow1, '140'])
  call gruvbox_material#highlight('ColorColumn', ['NONE', 'NONE'], [yellow1, '140'])

  "
  " CoC completion popup, :buffer list.
  "
  call gruvbox_material#highlight('Pmenu', ['NONE', 'NONE'], [yellow1, '140'])
  call gruvbox_material#highlight('CocFloating', ['NONE', 'NONE'], [yellow1, '140'])
  call gruvbox_material#highlight('PmenuSel', ['NONE', 'NONE'], [yellow5, '140'])

  "
  " Sidebar on CocFloating popop.
  "
  call gruvbox_material#highlight('CocFloatSbar', ['NONE', 'NONE'], [orange1, '140'])
  call gruvbox_material#highlight('CocFloatThumb', ['NONE', 'NONE'], [orange2, '140'])

  call gruvbox_material#highlight('CocSearch', ['NONE', 'NONE'], [yellow1, '140'])

  "
  " Visual selection.
  "
  call gruvbox_material#highlight('Visual', ['NONE', 'NONE'], [yellow3, '140'])
]]

----
-- Gruvbox colorscheme
--
-- Setup must be called before loading the colorscheme.
--
-- require("gruvbox").setup({
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = {
--     strings = false,
--     operators = false,
--     comments = false,
--   },
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "hard", -- can be "hard", "soft" or empty string
--   overrides = {},
--   dim_inactive = false,
--   transparent_mode = false,
--   palette_overrides = {
--     -- Background color.
--     light0_hard = "#f9f5d7",
--
--     -- CursorColumn, CursorColumn.
--     light1 = "#f9f5c7",
--
--     light2 = "#f9f5c7",
--     faded_blue = "#ca8212",
--   },
-- })

-- vim.cmd("colorscheme gruvbox")

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

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<C-s>', ':update<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:update<CR>')


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

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
    -- component_separators = '|',
    -- section_separators = '',
  },
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
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


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
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
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

------------------------------------------------------------------------------
-- coc-git
--
vim.cmd [[
  call coc#config('git.addGBlameToVirtualText', v:true)
]]

--
-- Temporary until I find better way of doing it. To toggle git line
-- git blame, run this in nvim command line mode:
--
--   :lua toggle_coc_vim_blame()
--
toggle_coc_vim_blame = function ()
  local showing = vim.g.coc_git_hide_blame_virtual_text

  vim.g.coc_git_hide_blame_virtual_text = not showing

  return showing
end

--
-- Call it once so we disable it by default when opening nvim.
--
toggle_coc_vim_blame()

--
-- Toggle git line blame with <leader>tgb keybinding.
--
vim.keymap.set(
  'n',
  '<Leader>y',
  function()
    local showing = toggle_coc_vim_blame()

    -- local showing = vim.g.coc_git_hide_blame_virtual_text

    print(
      string.format(
        'MSG «coc-git»: Git line blame %s.',
        showing and 'enabled' or 'disabled'
      )
    )
  end,
  { desc = 'Toggle coc-vim virutal text line blame' }
)

require("nvim-tree").setup()

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

------------------------------------------------------------------------
-- CoC — Conquer of Completion
-- ---------------------------
vim.cmd [[
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-solargraph',
      \ 'coc-yaml',
      \ 'coc-css',
      \ 'coc-git',
      \ ]

"
" “Go To” code navigation.
"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"
" Suggest semantic completions with Ctrl+Tab. Works really well,
" and handles suggestions of object properties. Example:
"
" type TParams {
"   url: string,
"   method: string,
" }
"
" Now, typing “const params: TParams { <C-Space>” displays
" url, method, and their types and even documentation,
" if available.
"
inoremap <silent><expr> <C-Space> coc#refresh()

"
" Display diagnostics (errors and warnings) and documentation.
" Type uppercase ‘K’ to activate, and any motion (like ‘j’, ‘k’,
" ‘h’, ‘b’, ‘<C-o>’, ‘<C-i>’, etc.) to deactivate.
"
nnoremap <silent> K :call CocAction('doHover')<CR>

"
" Navigate to next/prev errors.
"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"
" Rename symbol
"
nmap <leader>rn <Plug>(coc-rename)
]]

------------------------------------------------------------------------------
-- nvim-tree
--
-- vim.keymap.set('n', '<F3>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader>ff', ':NvimTreeFindFile<CR>')

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
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
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
    \ 'width': 0.9,
    \ 'height': 0.9,
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
let g:fzf_preview_window = winwidth(0) < 96 ? 'up:52%' : 'right:52%'

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>gf :GitFiles<CR>
nnoremap <Leader>g? :GF?<CR>
nnoremap <Leader>bb :Buffers<CR>
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
-- LuaSnip
--
-- Take a look at ~/work/src/dotfiles/.config/nvim/after/plugin/luasnip.lua
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

vim.keymap.set(
  'n',
  '<leader><leader>s',
  '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>'
)

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

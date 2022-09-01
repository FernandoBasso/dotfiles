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

  use 'gpanders/editorconfig.nvim'

  use 'tpope/vim-fugitive'                                                        -- Git commands in nvim
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }       -- Add git related info in the signs columns and popups
  use 'numToStr/Comment.nvim'                                                     -- "gc" to comment visual regions/lines
  use 'nvim-treesitter/nvim-treesitter'                                           -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter-textobjects'                               --  Additional textobjects for treesitter
  use 'sainnhe/gruvbox-material'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  --
  -- Looks like we don't have purescript treesitter parser yet (2022).
  --
  use 'purescript-contrib/purescript-vim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  use 'simrat39/symbols-outline.nvim'

  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end
  }
  use 'junegunn/fzf.vim'

  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use 'preservim/vim-markdown'

  use 'L3MON4D3/LuaSnip'

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
  let g:gruvbox_material_background = 'hard'
  let g:gruvbox_material_palette = 'material'
  let g:gruvbox_material_disable_italic_comment = 1
  let g:gruvbox_material_diagnostic_text_highlight = 0
  let g:gruvbox_material_diagnostic_line_highlight = 0
  let g:gruvbox_material_diagnostic_virtual_text = 'colored'

  colorscheme gruvbox-material
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
  indent = { enable = true },
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
      \ 'coc-diagnostic',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-solargraph',
      \ 'coc-css',
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
vim.keymap.set('n', '<Leader>ff', ':NvimTreeFindFile')

------------------------------------------------------------------------------
-- Symbols-Outline
--
require('symbols-outline').setup()
----
-- Toggle Nvim Tree and Symbols outline
--
vim.keymap.set('n', '<F3>', function() vim.api.nvim_command('NvimTreeToggle') end)
vim.keymap.set('n', '<F4>', function() vim.api.nvim_command('SymbolsOutline') end)

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

------------------------------------------------------------------------------
-- BarBar
--
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-p>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-n>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-,>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferMoveNext<CR>', opts)
-- Pin/unpin buffer
-- map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

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
let g:fzf_preview_window = winwidth(0) < 96 ? 'up:64%' : 'right:42%'

""
" Search files.
"
map <Leader>sf :GitFiles<CR>

""
" Search buffers.
"
map <Leader>b :Buffers<CR>
nnoremap <Leader>rg :Rg!<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>m :Marks<CR>

let files_to_source = [
      \ '~/work/local/libdev.vim',
      \ '~/work/src/dotfiles/vim-utils.vim',
      \ '~/work/src/dotfiles/.vim/digraphs.vim'
      \ ]

for file in files_to_source
  if filereadable(expand(file))
    execute 'source' . file
  endif
endfor
]]



vim.cmd [[
" press <Tab> to expand or jump in a snippet. These can also be mapped
" separately via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'

" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets('javascript', {
  s('ternary', {
    i(1, 'cond'), t(' ? '), i(2, 'then'), t(' : '), i(3, 'else')
  }),

  s('doc', {
    t({'/**', ''}),
    t({' * '}), i(1, 'Function info...'), t({'', ''}),
    t({' *', ''}),
    t({' * @param '}), i(2, '...'), t({'', ''}),
    t({' * @returns '}), i(3, '...'), t({'', ''}),
    t({' */', ''}),
  })
}, { key = 'js' })

--
-- vim: tw=72 ts=2 sts=2 sw=2 et
--

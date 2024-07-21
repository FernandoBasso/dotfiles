----
-- Set <space> as the leader key.
--
-- Must happen before plugins are loaded (otherwise wrong leader
-- will be used).
--
-- • :help mapleader
--
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

----
--
--
-- Set to true if you have a Nerd Font installed and selected in the
-- terminal; false otherwise.
vim.g.have_nerd_font = true

----
-- Line numbers.
--
vim.opt.number = true
vim.opt.relativenumber = false

----
-- Enable mouse, not too much for navigating the code, but to help
-- resizing windows in a more naturall way.
--
vim.opt.mouse = 'a'

----
-- Show mode is already in status line.
--
vim.opt.showmode = false

----
-- Sync vim and system clipboard.
--
-- • :help clipboard
-- • :help 'clipboard'
--
vim.opt.clipboard = ''

----
-- Help readability of wrapped lines.
--
-- • :help 'breakindent'
--
vim.opt.breakindent = true

----
-- Save undo history to a file?
--
-- • :help undo-persistence
-- • :help 'undofile'
--
vim.opt.undofile = false

----
-- Case-insensitive searches by default unless search is prepended with
-- `\C`, like `/\CNul` or `?\Cnul.
--
-- • :help 'ignorecase'
--
vim.opt.ignorecase = true

----
-- Even with ignorecase on, if at least one char is uppercase, then it
-- the search switches to case-sensitive automatically for that search.
--
-- • :help 'smartcase'
--
vim.opt.smartcase = true

----
-- Keep signcolumn on by default.
--
-- • :help 'signcolumn'
--
vim.opt.signcolumn = 'yes'

----
-- Milliseconds to write to swapfile. Also influences CursorHold.
--
-- • :help 'updatetime'
--
vim.opt.updatetime = 250

----
-- Decrease mapped sequence wait time, for example, how long leader
-- waits for the next char in the map sequence.
--
-- Also influences how long to wait before which-key (if installed)
-- waits until popup with suggestions show up.
--
-- • :help 'timeoutlen'
--
vim.opt.timeoutlen = 250

----
-- Sets how to visually display certain whitespace-like special chars.
--
-- • :help 'list'
-- • :help 'listchars'
--
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

----
-- Live-preview subsitutions as we type in split window.
--
-- • :help 'inccommand'
--
vim.opt.inccommand = 'split'

----
-- Show cursor line to better see which line is being worked on.
-- Specially useful for pair programming.
--
-- • :help 'cursorline'
--
vim.opt.cursorline = true

----
-- Minimum number of lines above and below the cursor.
--
-- • :help 'scrolloff'
--
vim.opt.scrolloff = 6

------------------------------------------------------------------------
-- Basic Keymaps
--
-- • :help vim.keymap.set()
--

----
-- Save with Ctrl+s. See `:help update`.
--
vim.keymap.set('n', '<C-s>', ':update<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:update<CR>')

----
-- Reload $MYVIMRC.
--
vim.keymap.set(
  'n',
  '<Leader>rr',
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
    print('NVim config as been reloaded!')
  end
)

----
-- Diagnostic keymaps.
--
vim.keymap.set(
  'n',
  '[d',
  vim.diagnostic.goto_prev,
  { desc = 'Go to previous [D]iagnostic message' }
)

vim.keymap.set(
  'n',
  ']d',
  vim.diagnostic.goto_next,
  { desc = 'Go to next [D]iagnostic message' }
)

vim.keymap.set(
  'n',
  '<leader>e',
  vim.diagnostic.open_float,
  { desc = 'Show diagnostic [E]rror messages' }
)

vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

----
-- Highlight when yanking (copying) text.
--
-- • :help vim.highlight.on_yank()
--
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup(
    'kickstart-highlight-yank',
    { clear = true }
  ),
  callback = function()
    vim.highlight.on_yank()
  end,
})

----
-- Exit terminal mode in the builtin terminal with a shortcut that is a
-- bit easier for people to discover. Otherwise, you normally need to
-- press <C-\><C-n>, which is not what someone will guess without a bit
-- more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your
-- own mapping or just use <C-\><C-n> to exit terminal mode.
--
vim.keymap.set(
  't',
  '<Esc><Esc>',
  '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)

------------------------------------------------------------------------
-- Install lazy.vim plugin manager
--
-- • https://github.com/folke/lazy.nvim
-- • :help lazy.nvim.txt`
--
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath
  }

  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field

vim.opt.rtp:prepend(lazypath)

----
-- Start installing and configuring plugins with lazy.
--
require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },
  checker = { enabled = true }

  ----
  -- Adds git commands.
  --
  -- {
  --   'tpope/vim-fugitive',
  --   opts = {}
  -- }
})

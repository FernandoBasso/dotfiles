----
-- Disable netrw to avoid conflicting with nvim-tree.
--
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

----
-- Must happen before plugins are loaded (otherwise wrong leader
-- will be used).
--
-- • :help mapleader
--
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

----
-- Probably not strictly necessary...
--
-- • :help 'termguicolors'
--
vim.o.termguicolors = true

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
-- resizing windows in a more natural way.
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
vim.opt.timeoutlen = 350

----
-- Sets how to visually display certain whitespace-like special chars.
--
-- • :help 'list'
-- • :help 'listchars'
--
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

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

vim.opt.clipboard = 'unnamed,unnamedplus'

------------------------------------------------------------------------
-- Restore cursor position.
--
vim.cmd [[
  augroup RestoreCursor
    autocmd!
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ let s:line = line("'\"")
      \ | if s:line >= 1 && s:line <= line("$") && &filetype !~# 'commit'
      \      && index(['xxd', 'gitrebase'], &filetype) == -1
      \ |   execute "normal! g`\""
      \ | endif
  augroup END
]]

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
-- Close the quickfix window.
--
vim.keymap.set(
  'n',
  '<Leader>cq',
  function ()
    vim.cmd('cclose')
  end,
  { desc = '[C]lose [Q]uickfix window' }
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
-- Run prettier on the current buffer.
--
-- Does not restore the cursor position. Go back to the exact
-- cursor position with `' (that's a backtick followed by a
-- single quote).
--
vim.cmd [[
  nnoremap _fp :silent %!npx prettier --stdin-filepath %<CR>
]]

----
-- Run gofmt on the current buffer.
--
vim.cmd [[
  nnoremap _fg :silent !gofmt -w %<CR>
]]

----
-- Close all buffers except the current one.
--
-- In native vim, something like this would do:
--
--   nnoremap \o :%bd! \| edit # \| buffer # \| bdelete!<CR>
--
-- Ideas from here:
--
-- • https://stackoverflow.com/questions/4545275/vim-close-all-buffers-but-this-one
--

local close_all_buffers_except_current = function()
  local current_buf = vim.fn.bufnr()
  local current_win = vim.fn.win_getid()
  local bufs = vim.fn.getbufinfo({buflisted = 1})

  for _, buf in ipairs(bufs) do
    if buf.bufnr ~= current_buf then
      vim.cmd("silent! bdelete " .. buf.bufnr)
    end
  end

  vim.fn.win_gotoid(current_win)
end

----
-- ‘o’ is for ‘only’.
--
vim.keymap.set(
  'n',
  '<Leader>o',
  close_all_buffers_except_current,
  {
    silent = true,
    desc = 'Close all buffers except the current active one',
  }
)

----
-- Add command to copy current buffer/file relative path to
-- the clipboard.
--
vim.api.nvim_create_user_command('CopyRelativePath', function()
  local path = vim.fn.expand('%:h:p')
  vim.fn.setreg('+', path)
  vim.notify('Path ‘' .. path .. '’ copied to the clipboard')
end, {})

vim.keymap.set(
  'n',
  '<Leader>yp',
  function()
    vim.cmd('CopyRelativePath')
  end,
  { desc = 'Copy current buffer/file relative path to the clipboard' }
)

----
-- Start installing and configuring plugins with lazy.
--
require('lazy').setup({
  spec = {
    {
      'gpanders/editorconfig.nvim',
      lazy = false,
    },
    {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        -- vim.g.gruvbox_material_enable_italic = false
        vim.g.gruvbox_material_foreground = 'material'
        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_enable_italic = false
        vim.g.gruvbox_material_enable_italic = 0
        vim.g.gruvbox_material_disable_italic_comment = 1
        vim.cmd.colorscheme('gruvbox-material')
      end
    },
    { import = 'plugins' },
  },
  checker = { enabled = false },
  install = {
    missing = true,
    colorscheme = { 'gruvbox-material' },
  }
})

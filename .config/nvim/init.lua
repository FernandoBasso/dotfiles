local opt = vim.opt
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local homedir = os.getenv('HOME')

local function keymap(mode, keys, action, description)
  vim.keymap.set(
    mode,
    keys,
    action,
    {
      noremap = true,
      silent = true,
      nowait = true,
      desc = description,
    }
  )
end

vim.g.mapleader = " "

opt.guicursor = "i:block"
opt.signcolumn = "yes:1"
opt.termguicolors = true
opt.ignorecase = true
opt.swapfile = true
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.number = true
opt.relativenumber = false
opt.numberwidth = 2
opt.wrap = false
opt.cursorline = true
opt.scrolloff = 6
opt.inccommand = "nosplit"
opt.completeopt = { "menuone", "popup", "noinsert" }
opt.winborder = "rounded"
opt.hlsearch = false

----
-- Listchars with some disabled as they conflict or become messy
-- when combined with ident guides or other plugins.
--
opt.list = true
opt.listchars = {
  -- space        = "·",
  nbsp            = "␣",
  multispace      = "·",
  trail           = "·",
  -- lead            = "¦",
  -- leadmultispace  = "¦   ",
  conceal         = "░",
  precedes        = "❮",
  extends         = "❯",
  tab             = "␉ ",
  -- leadtab         = "╌╌¦",
}

vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set laststatus=2")

vim.cmd("set path+=**/*")

opt.backup = true
opt.backupext = ".vimbkp"
opt.backupdir = homedir .. "/Temp/vim_bkp/"
opt.directory = homedir .. "/Temp/vim_tmp//"


----
-- Restore cursor position. :help restore-cursor. It has to come before
-- the line vim.cmd.filetype("plugin indent on") for some reason, else
-- it doesn't work.
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

vim.cmd.filetype("plugin indent on")

----
-- Colorscheme
--
-- Retrobox comes with both vim and nvim. A good one! Currently, I'm
-- using Gruvbox though, as it has better support for third-party stuff
-- and LSP. Diagnostics and other things get more readable with Gruvbox.
-- Look in plugins.lua.
--
-- vim.cmd("colorscheme retrobox")

----
-- Save with Ctrl+; (I just like it). See `:help update`.
--
vim.keymap.set('n', '<C-;>', ':update<CR>')
vim.keymap.set('i', '<C-;>', '<Esc>:update<CR>')

----
-- Source $HOME/.config/nvim/init.lua.
--
keymap(
  "n",
  "<Leader>rr",
  function()
    vim.cmd("source $MYVIMRC")
    print("NVim configs have been reloaded")
  end,
  "NVIM: reload config"
)


----
-- Close the quickfix window.
--
keymap(
  'n',
  '<Leader>qo',
  function()
    vim.cmd('copen')
  end,
  '[Q]uickfix [O]pen'
)

----
-- Close the quickfix window.
--
keymap(
  'n',
  '<Leader>qc',
  function()
    vim.cmd('cclose')
  end,
  '[Q]uickfix [C]lose'
)

----
-- Next quickfix item
--
keymap(
  'n',
  '<Leader>qn',
  function()
    vim.cmd('cnext')
  end,
  '[Q]uickfix [N]ext item'
)

----
-- Previous quickfix item
--
keymap(
  'n',
  '<Leader>qp',
  function()
    vim.cmd('cprevious')
  end,
  '[Q]uickfix [P]revious item'
)

----
-- Highlight yanked text.
--
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 170 })
    end,
    group = highlight_group,
})

----
-- Yank with context & file path.
--
-- https://xata.io/blog/configuring-neovim-coding-agents
--
local yank = require("yank")

keymap(
  'n',
  '<Leader>yr',
  function()
    yank.yank_path(yank.get_buffer_cwd_relative(), 'relative')
  end,
  '[Y]ank [R]elative path'
)

keymap(
  'v',
  '<Leader>yr',
  function()
    yank.yank_visual_with_path(yank.get_buffer_cwd_relative(), 'relative')
  end,
  '[Y]ank selection with [R]elative path'
)

vim.cmd [[
  autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
  autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
]]

require("plugins")
require("lsp")

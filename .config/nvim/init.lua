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
opt.listchars = "tab:␉ ,trail:·"
opt.list = true
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

vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set laststatus=2")

vim.cmd("set path+=**/*")

opt.backup = true
opt.backupext = ".vimbkp"
opt.backupdir = homedir .. "/Temp/vim_bkp/"
opt.directory = homedir .. "/Temp/vim_tmp//"

vim.cmd.filetype("plugin indent on")

----
-- Colorscheme
--
vim.cmd("colorscheme retrobox")

----
-- Save with Ctrl+; (I just like it). See `:help update`.
--
vim.keymap.set('n', '<C-;>', ':update<CR>')
vim.keymap.set('i', '<C-;>', '<Esc>:update<CR>')
keymap(
  "n",
  "<Leader>rr",
  function()
    -- "<cmd>source $MYVIMRC<CR>",
    vim.cmd("source $MYVIMRC")
    print("NVim configs have been reloaded")
  end,
  "NVIM: reload config"
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
-- Restore cursor position. :help restore-cursor.
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

require("plugins")
require("lsp")

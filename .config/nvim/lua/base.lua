require('packer').startup(function()
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'preservim/nerdtree'
  -- use 'morhetz/gruvbox'
  use {
    'ellisonleao/gruvbox.nvim',
    requires = {{ 'rktjmp/lush.nvim' }}
  }
  use 'luisiacc/gruvbox-baby'
  use 'sainnhe/gruvbox-material'
  -- use 'neovim/nvim-lspconfig'

  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)

vim.o.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:update<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "<C-s>", ":update<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<F3>", ":NERDTreeToggle<CR>", { noremap = true })

vim.api.nvim_set_keymap(
  "n",
  "<Leader>ff",
  "<cmd>Telescope find_files<cr>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>fg",
  "<cmd>Telescope live_grep<cr>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>f?",
  "<cmd>Telescope git_status<cr>",
  { noremap = true }
)

vim.cmd 'source ~/.config/nvim/config-coc.vim'

vim.g.gruvbox_material_disable_italic_comment = 1
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox-baby]])
vim.cmd([[colorscheme gruvbox-material]])

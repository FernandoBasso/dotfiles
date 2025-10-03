vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
vim.o.autoread = true
vim.wo.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakindentopt = { 'shift:2', 'sbr' }
vim.opt.showbreak = '↳ '
vim.opt.sidescrolloff = 8
vim.opt.display:append('lastline')

vim.cmd("set number")
vim.cmd("set colorcolumn=72,80")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set laststatus=2")
vim.g.transparent_background = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.cmd("set path+=**/*")

vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		source = "always",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		source = "always"
	},
})

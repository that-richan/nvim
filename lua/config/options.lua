vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.markdown_fences_languages = {
	"ts=typescript"
}
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.confirm = true
opt.cursorline = true
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.undofile = true
opt.smoothscroll = true
opt.linebreak = true
opt.wrap = false
opt.termguicolors = true
opt.winminwidth = 5
opt.list = true
opt.completeopt = "menu,menuone,noinsert"
opt.laststatus = 0
opt.pumblend = 100
opt.shell = "bash"
opt.shellcmdflag = "-c"

vim.wo.signcolumn = "yes"

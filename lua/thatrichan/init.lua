require("thatrichan.remap")
require("thatrichan.lazyvim")
require("thatrichan.nvim-tree")
require("thatrichan.lsp")
require("thatrichan.formatter")
require("thatrichan.indent-blankline")
require("thatrichan.comment")

if vim.g.neovide then
	require("thatrichan.neovide")
end

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.relativenumber = true
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = ''

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

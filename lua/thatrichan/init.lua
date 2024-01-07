require("thatrichan.remap")
require("thatrichan.lazyvim")
require("thatrichan.nvim-tree")
require("thatrichan.lsp")
require("thatrichan.formatter")
require("thatrichan.indent-blankline")
if vim.g.neovide then
	require("thatrichan.neovide")
end

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.wo.relativenumber = true
vim.wo.number = true

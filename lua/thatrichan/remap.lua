vim.g.mapleader = " "

-- Move lines up or down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m >+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Center cursor after moving down half-page"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Center cursor after moving up half-page"})
